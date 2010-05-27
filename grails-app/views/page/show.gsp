<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main" />
</head>
<body>
	<header>
		<h1>${page.name}</h1>	
		<div class="meta">
			<h2 id="scamp-title">${page.description}</h2>
			<div>
				<h3>Author</h3><span class="author"><a href="/user/philhawksworth" class="user">philhawksworth</a></span>	
			</div>
			<div>
				<h3>Date:</h3><span class="date">9th May 2010</span>				
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
		<a href='#' class='addNote'>add note</a>
		<ol class='notes'>
			<li data-pos-x="0"  data-pos-y="0">item 1 notes</li>
			<li data-pos-x="30"  data-pos-y="60">item 2 notes</li>
			<li data-pos-x="40"  data-pos-y="100">item 3 notes</li>
			<li data-pos-x="50"  data-pos-y="140">item 4 notes</li>
		</ol>
		<a href='#' class='addNote'>add note</a>
	</div>
	
</body>
</html>
