
<%@ page import="scampi.Annotation" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'annotation.label', default: 'Annotation')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'annotation.id.label', default: 'Id')}" />
                        
                            <th><g:message code="annotation.page.label" default="Page" /></th>
                   	    
                            <g:sortableColumn property="description" title="${message(code: 'annotation.description.label', default: 'Description')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'annotation.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="lastUpdated" title="${message(code: 'annotation.lastUpdated.label', default: 'Last Updated')}" />
                        
                            <g:sortableColumn property="dateCreated" title="${message(code: 'annotation.dateCreated.label', default: 'Date Created')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${annotationInstanceList}" status="i" var="annotationInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${annotationInstance.id}">${fieldValue(bean: annotationInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: annotationInstance, field: "page")}</td>
                        
                            <td>${fieldValue(bean: annotationInstance, field: "description")}</td>
                        
                            <td>${fieldValue(bean: annotationInstance, field: "name")}</td>
                        
                            <td><g:formatDate date="${annotationInstance.lastUpdated}" /></td>
                        
                            <td><g:formatDate date="${annotationInstance.dateCreated}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${annotationInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
