<html>
<head>
	<meta name="layout" content="main">
</head>
<body>
<header>
	<h1>scampi</h1>	

	<div id="projects">
		<h2>Projects</h2>
		<ul>
		<g:each in="${projects}" var="project" status="i">
			<li><a href="/project/${project.name}">${project.name}</a></li>
		</g:each>
		</ul>
		<form action="/project/save" method="post">
			Create a new project...
			<input name="name" value="" id="name" type="text">
			<input name="create" class="save" value="Create" id="create" type="submit">
		</form>
	</div>
</body>
</html>