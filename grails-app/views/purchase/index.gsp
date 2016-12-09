<g:applyLayout name="bootstrapTemplate">
    <content tag="banner">
        <div class="jumbotron text-center">
            <h1>Your Purchase</h1>
        </div>
    </content>
    <content tag="body">
        <div id="show-purchase" class="content scaffold-show" role="main">
            <h1>Purchase Information</h1>
            <p>Please review the information below before proceeding.</p>
            <div class="row">
                <div class="col-xs-12">
                    <g:link class="btn btn-warning pull-right " action="index" controller="cart">
                        <g:message code="default.button.back.label" default="Back" />
                    </g:link>
                </div>
            </div>

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
                <h3>Client: ${user}</h3>
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

                <div class="col-xs-12">
                    <g:submitButton name="create" class="btn btn-block btn-success" value="Place Order" />
                </div>
            </g:form>
        </div>
    </content>
</g:applyLayout>