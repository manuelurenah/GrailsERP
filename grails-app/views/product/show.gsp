<g:applyLayout name="bootstrapTemplate">
    <content tag="body">
        <div id="show-product" class="content scaffold-show" role="main">
            <h1>Product Fields</h1>
            <div class="row">
                <g:link class="btn btn-warning pull-right " action="index">
                    <g:message code="default.button.back.label" default="Back" />
                </g:link>
            </div>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <div class="row" style="padding: 8px">
                <div class="col-xs-12 col-md-4">
                    <img class="img-responsive center-block"
                         src="/product/render_image/${product.id}"
                         alt=""
                         width="150px"
                         height="150px" />
                </div>
                <div class="col-xs-12 col-md-8">
                    <ol class="property-list product">

                        <li class="fieldcontain">
                            <span id="title-label" class="property-label">Title</span>
                            <div class="property-value" aria-labelledby="title-label">${product.title}</div>
                        </li>

                        <li class="fieldcontain">
                            <span id="description-label" class="property-label">Description</span>
                            <div class="property-value" aria-labelledby="description-label">${product.description}</div>
                        </li>

                        <li class="fieldcontain">
                            <span id="price-label" class="property-label">Price</span>
                            <div class="property-value" aria-labelledby="price-label">${product.price}</div>
                        </li>

                        <li class="fieldcontain">
                            <span id="quantity-label" class="property-label">Quantity</span>
                            <div class="property-value" aria-labelledby="quantity-label">${product.quantity}</div>
                        </li>

                        <li class="fieldcontain">
                            <span id="lastUpdated-label" class="property-label">Last Updated</span>
                            <div class="property-value" aria-labelledby="lastUpdated-label">${product.lastUpdated}</div>
                        </li>

                        <li class="fieldcontain">
                            <span id="dateCreated-label" class="property-label">Date Created</span>
                            <div class="property-value" aria-labelledby="dateCreated-label">${product.dateCreated}</div>
                        </li>

                    </ol>
                </div>
            </div>
            <g:form resource="${this.product}" method="DELETE">
                <div class="col-xs-6">
                    <g:link class="btn btn-block btn-info" action="edit" resource="${this.product}">
                        <g:message code="default.button.edit.label" default="Edit" />
                    </g:link>
                </div>
                <div class="col-xs-6">
                    <input class="btn btn-block btn-danger" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                           onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </div>
            </g:form>
    </content>
</g:applyLayout>