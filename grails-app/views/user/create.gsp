<%@ page import="grailserp.Department" %>
<g:applyLayout name="bootstrapTemplate">
    <content tag="banner">
        <div class="jumbotron text-center">
            <h1>New User</h1>
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
            <g:form action="save">
                <div class="form-group">
                    <label for="name">Name: </label>
                    <input type="text" class="form-control" name="name" id="name" />
                </div>
                <div class="form-group">
                    <label for="lastname">Last Name: </label>
                    <input type="text" class="form-control" name="lastname" id="lastname" />
                </div>
                <div class="form-group">
                    <label for="state">State: </label>
                    <input type="text" class="form-control" name="state" id="state" />
                </div>
                <div class="form-group">
                    <label for="city">City: </label>
                    <input type="text" class="form-control" name="city" id="city" />
                </div>
                <div class="form-group">
                    <label for="address">Address: </label>
                    <input type="text" class="form-control" name="address" id="address" />
                </div>
                <div class="form-group">
                    <label for="zip">Zip: </label>
                    <input type="text" class="form-control" name="zip" id="zip" />
                </div>
                <div class="form-group">
                    <label for="email">E-mail: </label>
                    <input type="email" class="form-control" name="email" id="email" />
                </div>
                <div class="form-group">
                    <label for="password">Password: </label>
                    <input type="password" class="form-control" name="password" id="password" />
                </div>
                <div class="form-group">
                    <label for="userType">User Type: </label>
                    <select class="form-control" name="userType" id="userType">
                        <option>Jurídico</option>
                        <option>Consumidor Final</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="department">Department: </label>
                    <g:select class="form-control"
                              name="department"
                              from="${Department.list()}"
                              optionKey="id"
                              value="" />
                </div>
                <div class="checkbox">
                    <label>
                        <g:checkBox class="checkbox"
                                    name="isAdmin"
                                    value="${true}" /> Administrador
                    </label>
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