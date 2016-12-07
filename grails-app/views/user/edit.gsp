<%@ page import="grailserp.Department" %>
<g:applyLayout name="bootstrapTemplate">
    <content tag="banner">
        <div class="jumbotron text-center">
            <h1>Edit User</h1>
            <hr>
            <h3>User: ${this.user}</h3>
        </div>
    </content>
    <content tag="body">
        <div id="create-user" class="row" role="main">
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.user}">
                <ul class="errors" role="alert">
                    <g:eachError bean="${this.user}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
                            <g:message error="${error}"/>
                        </li>
                    </g:eachError>
                </ul>
            </g:hasErrors>
            <g:form action="update" id="${user.id}">
                <div class="form-group">
                    <label for="name">Name: </label>
                    <input type="text" class="form-control" name="name" id="name" value="${user.name}" />
                </div>
                <div class="form-group">
                    <label for="lastname">Last Name: </label>
                    <input type="text" class="form-control" name="lastname" id="lastname" value="${user.lastname}" />
                </div>
                <div class="form-group">
                    <label for="email">E-mail: </label>
                    <input type="email" class="form-control" name="email" id="email" value="${user.email}" />
                </div>
                <div class="form-group">
                    <label for="password">Password: </label>
                    <input type="password" class="form-control" name="password" id="password" value="${user.password}" />
                </div>
                <div class="form-group">
                    <label for="department">Department: </label>
                    <select class="form-control" name="department" id="department">
                        <g:each var="dept" in="${Department.list()}">
                            <option <g:if test="${user.department}">selected</g:if>>${dept}</option>
                        </g:each>
                    </select>
                </div>
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="isAdmin" value="" /> Administrator
                    </label>
                </div>
                <div class="col-xs-6">
                    <g:submitButton name="create" class="btn btn-success btn-block" value="Save" />
                </div>
                <div class="col-xs-6">
                    <g:link class="btn btn-danger btn-block" action="index">Cancel</g:link>
                </div>

            </g:form>
        </div>
    </content>
</g:applyLayout>