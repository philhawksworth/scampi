<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main" />
</head>
<body>
	<div id="stage" page="${page.id}"/>
	<header>
		<h1>${page.name}</h1>	
		<div class="meta">
			<h2 id="scamp-title">${page.description}</h2>
			<div>
				<h3>Author</h3><span class="author"><a href="/user/philhawksworth" class="user">philhawksworth</a></span>	
			</div>
			<div>
				<h3>Date:</h3><span class="date">${page.dateCreated}</span>				
			</div>
			<div>
				<h3>Shortlink:</h3><span class="shortlink"><a href="http://scampi.com/hsfha">http://scampi.com/hsfha</a></span>
			</div>
		</div>
	</header>
	
	<div id="display">
		<img src="${page.imageUri}">
		<div id="notes"></div>

	</div>
	<div id="legend">
		<ol class='notes'>
			<g:each var="annotation" in="${page.annotations}" status="i">
			<li id="${annotation.id}" data-pos-x="${annotation.x}"  data-pos-y="${annotation.y}">${annotation.name}</li>
			</g:each>
		</ol>
		<a href='#' class='addNote'>add note</a> /
		<a href="#" class='saveNotes'>save notes</a>
	</div>
	
</body>
</html>
