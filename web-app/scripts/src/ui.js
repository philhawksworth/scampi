// Clutter-free global namespace.
var scampi = {};


// Some potions for the scampi interface.
scampi.options = {
	displayMode: 'legend', // legend | inline
	readonly: false
};


scampi.init = function() {
	scampi.renderAnnotations();
	scampi.eventHandlers();
};


// add our event listeners.
scampi.eventHandlers = function() {
	
	// highlight markers.
	$('#legend ol.notes li').live("mouseenter", function(ev) {
		if($("#legend").hasClass("edit")) {
			return;
		}
		var note = $("#legend ol.notes li");
		scampi.showAnnotationsUI($(ev.target));
		$("#display #notes p:eq("+ note.index(this) +")").addClass('activeNote');
	});
	$('#legend ol.notes li').live("mouseleave", function(ev) {
		if($("#legend").hasClass("edit")) {
			return;
		}
		var note = $("#legend ol.notes li");
		scampi.hideAnnotationsUI($(ev.target));
		$("#display #notes p:eq("+ note.index(this) +")").removeClass('activeNote');
	});

	// save the text of a note.
	$("a.saveNote").live("click", function(){
		var li = $(this).parent();
		var txt = li.find('textarea').val();
		li.empty()
			.html(txt)
			.attr("data-pos-x", 100)
			.attr("data-pos-y", 100);
		scampi.renderAnnotations();
		$("#legend").removeClass("edit");
	});
	
	// cancel changes to a note
	$("a.saveNote").live("click", function(){
		// we should stash the original note data in case of this revert action.
		$("#legend").removeClass("edit");
	});
	
	
	// add note
	$("a.addNote").click(function() {
		$("#legend").addClass("edit");
		$("#legend ol.notes").append("<li><textarea></textarea><a href='#' class='noteControl saveNote'>save</a><a href='#' class='noteControl discardNote'>cancel</a></li>");
	});

	// sync notes
	$("a.saveNotes").click(function() {
		$(".notes li").each(function(index){

			var data = {
				id:$(this).attr('id'),
				name:$(this).text(),
				description:$(this).text(),
				x:$(this).attr('data-pos-x'),
				y:$(this).attr('data-pos-y'),
				'page.id':$('div#stage').attr('page')
			};
			
			$.ajax({
			  type: 'POST',
			  url: '/annotation/update',
			  data: data
			});
		});
	});
   
    // $("#droppable").droppable({
    //   drop: function() { alert('dropped'); }
    // });
	
};


scampi.showAnnotationsUI = function(note) {
	note.addClass('hover');
	$("<div class='controls'><a href='#' class='noteControl editNote'>save</a><a href='#' class='noteControl discardNote'>delete</a></div>").appendTo(note);
};


scampi.hideAnnotationsUI = function(note) {
	note.removeClass('hover');
	$("div.controls").remove();
};


// clear annotations
scampi.clearAnnotations = function() {
	$("#display #notes").empty();	
};


// get the notes from the legend and render them in the display.
scampi.renderAnnotations = function() {
	scampi.clearAnnotations();
	var note;
	$("#legend ol.notes li").each(function(index) {
		note = $(this);
		scampi.renderAnnotation({
			label: index+1,
			x: note.attr("data-pos-x"),
			y: note.attr("data-pos-y")
		});
	});
	 $("#display #notes p").draggable({ 
		containment: 'parent',
		stop: function(){ scampi.recordPositions(); }
	});
};


// update the data in the legend.
scampi.recordPositions = function() {
	$("#display #notes p").each(function(index) {
		marker = $(this);
		note = $('#legend ol.notes li').eq(index);
		note.attr({"data-pos-x": marker.css('left')});
		note.attr({"data-pos-y": marker.css('top')});
	});
	scampi.saveNotes();
};


// collect and post...
scampi.saveNotes = function() {
	var notes = [];
	var note;
	$("#legend ol.notes li").each(function(index) {
		note = $(this);
		notes.push({
			text: note.html(),
			x: note.attr("data-pos-x"),
			y: note.attr("data-pos-y")
		});
	});
	var json = {
		scampPath: document.location.pathname,
		scampTitle: $("#scamp-title").text(),
		notes: notes
	};
	// POST data. 
	console.log('json to post: ', json );
};


// render an annotation in the display.
scampi.renderAnnotation = function(note) {
	var marker = $("<p class='note-marker'>"+ note.label +"</p>");
	marker.css({"left": parseInt(note.x), "top":parseInt(note.y)});
	$("#display #notes").append(marker);
};


// Giddy-up.
$(document).ready(function() {
	scampi.init();
});
