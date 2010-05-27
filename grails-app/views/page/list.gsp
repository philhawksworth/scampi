
<%@ page import="scampi.Page" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'page.label', default: 'Page')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'page.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="imageUri" title="${message(code: 'page.imageUri.label', default: 'Image Uri')}" />
                        
                            <th><g:message code="page.project.label" default="Project" /></th>
                   	    
                            <g:sortableColumn property="description" title="${message(code: 'page.description.label', default: 'Description')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'page.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="lastUpdated" title="${message(code: 'page.lastUpdated.label', default: 'Last Updated')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${pageInstanceList}" status="i" var="pageInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${pageInstance.id}">${fieldValue(bean: pageInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: pageInstance, field: "imageUri")}</td>
                        
                            <td>${fieldValue(bean: pageInstance, field: "project")}</td>
                        
                            <td>${fieldValue(bean: pageInstance, field: "description")}</td>
                        
                            <td>${fieldValue(bean: pageInstance, field: "name")}</td>
                        
                            <td><g:formatDate date="${pageInstance.lastUpdated}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${pageInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
