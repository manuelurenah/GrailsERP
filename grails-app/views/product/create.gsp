<%@ page import="grailserp.Department" %>
<g:applyLayout name="bootstrapTemplate">
    <content tag="banner">
        <div class="jumbotron text-center">
            <h1>New Product</h1>
        </div>
    </content>
    <content tag="body">

        <div id="create-user" class="row" role="main">
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.user}">
                <ul class="errors" role="alert">
                    <g:eachError bean="${this.product}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
                            <g:message error="${error}"/>
                        </li>
                    </g:eachError>
                </ul>
            </g:hasErrors>
            <g:form action="save" >
                <div class="form-group">
                    <label for="title">Title: </label>
                    <input type="text" class="form-control" name="title" id="title" />
                </div>
                <div class="form-group">
                    <label for="description">Description: </label>
                    <textarea class="form-control" name="description" id="description" rows="4"></textarea>
                </div>
                <div class="form-group">
                    <label for="price">Price: </label>
                    <div class="input-group">
                        <span class="input-group-addon">$</span>
                        <input type="number" step="0.1" class="form-control" name="price" id="price" />
                    </div>

                </div>
                <div class="form-group">
                    <label for="quantity">Quantity: </label>
                    <input type="number" step="1" class="form-control" name="quantity" id="quantity" />
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