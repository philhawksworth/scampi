
<%@ page import="scampi.Annotation" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'annotation.label', default: 'Annotation')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${annotationInstance}">
            <div class="errors">
                <g:renderErrors bean="${annotationInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${annotationInstance?.id}" />
                <g:hiddenField name="version" value="${annotationInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="page"><g:message code="annotation.page.label" default="Page" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: annotationInstance, field: 'page', 'errors')}">
                                    <g:select name="page.id" from="${scampi.Page.list()}" optionKey="id" value="${annotationInstance?.page?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="description"><g:message code="annotation.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: annotationInstance, field: 'description', 'errors')}">
                                    <g:textField name="description" value="${annotationInstance?.description}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="annotation.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: annotationInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${annotationInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="lastUpdated"><g:message code="annotation.lastUpdated.label" default="Last Updated" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: annotationInstance, field: 'lastUpdated', 'errors')}">
                                    <g:datePicker name="lastUpdated" precision="day" value="${annotationInstance?.lastUpdated}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="dateCreated"><g:message code="annotation.dateCreated.label" default="Date Created" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: annotationInstance, field: 'dateCreated', 'errors')}">
                                    <g:datePicker name="dateCreated" precision="day" value="${annotationInstance?.dateCreated}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="y"><g:message code="annotation.y.label" default="Y" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: annotationInstance, field: 'y', 'errors')}">
                                    <g:textField name="y" value="${fieldValue(bean: annotationInstance, field: 'y')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="x"><g:message code="annotation.x.label" default="X" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: annotationInstance, field: 'x', 'errors')}">
                                    <g:textField name="x" value="${fieldValue(bean: annotationInstance, field: 'x')}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
