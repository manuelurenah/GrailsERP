<g:applyLayout name="bootstrapTemplate">
    <content tag="banner">
        <div class="jumbotron text-center">
            <h1>Your Purchase</h1>
        </div>
    </content>
    <content tag="body">
        <div id="show-purchase" class="content scaffold-show" role="main">
            <div class="row">
                <div class="col-xs-12">
                    <g:link class="btn btn-warning pull-right " action="index" controller="cart">
                        <g:message code="default.button.back.label" default="Back" />
                    </g:link>
                </div>
            </div>

            <h1>Purchase Information</h1>
            <div class="row">
                <p>Please review the information below before proceeding.</p>
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
            <h1>Client: ${user}</h1>
            <div class="row">
                <form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">
                    <input type="hidden" name="cmd" value="_cart">
                    <input type="hidden" name="business" value="seller@grailserm.com">
                    <input type="hidden" name="currency_code" value="USD">

                    %{--<input type="hidden" name="cbt" value="Finish up buying process"> --}%%{--  --}%
                    <input type="hidden" name="rm" value="2"> %{--Indicando que haga un redirect por el metodo POST--}%
                    <input type="hidden" name="return" value="${g.createLink(controller: 'purchase', action: 'save_purchase', absolute: true)}">
                    <input type="hidden" name="cancel_return" value="${g.createLink(controller: 'cart', action: 'index', absolute: true)}?cancelled=true">
                    <input type="hidden" name="upload" value="1">

                    <fieldset>
                        <legend>You are about to purchase:</legend>
                        <g:each in="${user.carts}" var="p" status="index">
                            <div class="form-group">
                                <h3 for="item_${index}"><b>${p.product.title}</b></h3>
                                <p> Quantity: <b>${p.quantity}</b></p>
                                <p> Total: $${p.quantity * p.product.price}</p>
                                <input type="hidden" name="item_name_${index+1}" value="${p.product.title}" />
                                <input type="hidden" name="item_number_${index+1}"  value="${p.product.id}" />
                                <input type="hidden" name="amount_${index+1}"  value="${p.product.price}" />
                                <input type="hidden" name="quantity_${index+1}"  value="${p.quantity}" />
                            </div>
                        </g:each>
                    </fieldset>
                    <fieldset>
                        <legend>Address Information</legend>
                        <input type="hidden" name="address_override" value="1">
                        <div class="form-group">
                            <label for="first_name">First Name: </label>
                            <input type="text" class="form-control" required name="first_name" id="first_name" value="${user.name}" />
                        </div>
                        <div class="form-group">
                            <label for="last_name">Last Name: </label>
                            <input type="text" class="form-control" required name="last_name" id="last_name" value="${user.lastname}" />
                        </div>
                        <div class="form-group">
                            <label for="address1">Address: </label>
                            <input type="text" class="form-control" required name="address1" id="address1" value="${user.address}" />
                        </div>
                        <div class="form-group">
                            <label for="city">City: </label>
                            <input type="text" class="form-control" required name="city" id="city" value="${user.city}" />
                        </div>
                        <div class="form-group">
                            <label for="state">State: </label>
                            <input type="text" class="form-control" required name="state" id="state" value="${user.state}" />
                        </div>
                        <div class="form-group">
                            <label for="zip">Zip: </label>
                            <input type="text" class="form-control" required   name="zip" id="zip" value="${user.zip}" />
                        </div>
                        <input type="hidden" name="country" value="DO"/>
                    </fieldset>


                    <div class="col-xs-12">
                        <input type="image" class="center-block" name="submit"
                               src="https://www.paypalobjects.com/en_US/i/btn/btn_buynow_LG.gif"
                               alt="PayPal - The safer, easier way to pay online">
                    </div>
                </form>
            </div>
        </div>
    </content>
</g:applyLayout>