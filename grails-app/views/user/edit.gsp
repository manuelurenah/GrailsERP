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
        <div id="edit-user" class="row" role="main">
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
                <fieldset>
                    <legend>Personal Information</legend>
                    <div class="form-group">
                        <label for="name">Name: </label>
                        <input type="text" class="form-control" name="name" id="name" value="${user.name}" />
                    </div>
                    <div class="form-group">
                        <label for="lastname">Last Name: </label>
                        <input type="text" class="form-control" name="lastname" id="lastname" value="${user.lastname}" />
                    </div>
                </fieldset>
                <fieldset>
                    <legend>Address</legend>
                    <div class="form-group">
                        <label for="state">State: </label>
                        <input type="text" class="form-control" name="state" id="state" value="${user.state}" />
                    </div>
                    <div class="form-group">
                        <label for="city">City: </label>
                        <input type="text" class="form-control" name="city" id="city" value="${user.city}" />
                    </div>
                    <div class="form-group">
                        <label for="address">Address: </label>
                        <input type="text" class="form-control" name="address" id="address" value="${user.address}" />
                    </div>
                    <div class="form-group">
                        <label for="zip">Zip: </label>
                        <input type="text" class="form-control" name="zip" id="zip" value="${user.zip}" />
                    </div>
                </fieldset>
                <fieldset>
                    <legend>General Information</legend>
                    <div class="form-group">
                        <label for="email">E-mail: </label>
                        <input type="email" class="form-control" name="email" id="email" value="${user.email}" />
                    </div>
                    <div class="form-group">
                        <label for="password">Password: </label>
                        <input type="password" class="form-control" name="password" id="password" value="${user.password}" />
                    </div>
                    <div class="form-group">
                        <label for="userType">User Type: </label>
                        <g:select class="form-control"
                                  name="userType"
                                  from="${['Jurídico', 'Consumidor Final']}"
                                  value="${user.userType}" />
                    </div>
                    <div class="form-group">
                        <label for="department">Department: </label>
                        <g:select class="form-control"
                                  name="department"
                                  from="${Department.list()}"
                                  optionKey="id"
                                  value="${user.department.id}" />
                    </div>
                </fieldset>
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