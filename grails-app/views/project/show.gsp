<html>
    <head>
        <meta name="layout" content="main" />
    </head>
    <body>

		<ul>
			<g:each in="${project.pages}" var="page" status="i">
				<li><a href="/project/${project.name}/${page.id}">${page.name}</a></li>
			</g:each>
		</ul>
		<form action="/page/save" method="post" enctype="multipart/form-data">
			<p>Create a new annotation</p>
			<p>
				<label for="description">Description</label>
				<input type="text" name="description" value="" id="description" />
			</p>
			<p>
				<label for="name">Name</label>
				<input type="text" name="name" value="" id="name" />
			</p>
			<p>
				<label for="image">Image</label>
				<input type="file" id="image" name="image" />
			</p>
			<input type="hidden" name="project.id" value="${project.id}" id="project.id" />
			<input type="submit" name="create" class="save" value="Create" id="create" />
		</form>

        <div class="buttons">
            <g:form>
                <g:hiddenField name="id" value="${project?.id}" />
                <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
            </g:form>
        </div>
    </body>
</html>
