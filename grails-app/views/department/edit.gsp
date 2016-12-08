<%@ page import="grailserp.Department" %>
<g:applyLayout name="bootstrapTemplate">
    <content tag="banner">
        <div class="jumbotron text-center">
            <h1>Edit Department</h1>
            <hr>
            <h3>${department.title}</h3>
        </div>
    </content>
    <content tag="body">

        <div id="edit-department" class="row" role="main">
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.department}">
                <ul class="errors" role="alert">
                    <g:eachError bean="${this.department}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
                            <g:message error="${error}"/>
                        </li>
                    </g:eachError>
                </ul>
            </g:hasErrors>
            <g:form action="save" >
                <div class="form-group">
                    <label for="title">Title: </label>
                    <input type="text" class="form-control" name="title" value="${department.title}" id="title" />
                </div>
                <div class="col-xs-6">
                    <g:submitButton name="create" class="btn btn-block btn-success" value="Save" />
                </div>
                <div class="col-xs-6">
                    <g:link class="btn btn-block btn-danger" action="index">Cancel</g:link>
                </div>

            </g:form>
        </div>
    </content>
</g:applyLayout>