<g:applyLayout name="bootstrapTemplate">
    <content tag="body">
        <div id="show-product" class="content scaffold-show" role="main">
            <h1>Product Information</h1>
            <div class="row">
                <div class="col-xs-12">
                    <g:link class="btn btn-warning pull-right " action="index" controller="home">
                        <g:message code="default.button.back.label" default="Back" />
                    </g:link>
                </div>
            </div>
            <br>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <div class="row">
                <div class="col-xs-12 col-md-4">
                    <img class="img-responsive center-block img-rounded"
                         src="/product/render_image/${product.id}"
                         alt="" />
                </div>
                <div class="col-xs-12 col-md-8">
                    <h2>${product.title}</h2>
                    <p>${product.description}</p>
                    <br>
                    <h2>Unit Price: ${product.price}</h2>
                    <p><b>Available: </b> ${product.quantity}</p>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <h2 class="text-center">Buy This Product Now!</h2>
                    <hr>
                </div>
                <g:form controller="cart" action="add" >
                    <input type="hidden" value="${product.id}" name="product">
                    <div class="col-xs-12 col-md-9">
                        <div class="form-group">
                            <g:if test="${product.quantity > 0}">
                                <label for="qnt">Quantity</label>
                                <select name="quantity" class="form-control" id="qnt" placeholder="Select product quantity to purchase">
                                    <g:each var="i" in="${1..Math.min(product.quantity, 99)}">
                                        <option value="${i}" <g:if test="${i==1}">
                                            selected
                                        </g:if>>${i}</option>
                                    </g:each>
                                </select>
                            </g:if>
                            <g:else>
                                <h3> Product is not available. </h3>
                            </g:else>
                            
                        </div>
                    </div>
                    <div class="col-xs-12 col-md-3">
                        <div class="form-group">
                            <label for="">&nbsp;</label>
                            <button type="submit" class="form-control btn btn-block btn-success"> Add to cart </button>
                        </div>
                    </div>
                </g:form>
            </div>
            <g:if test="${others}" >
                <div class="row">
                    <h2 class="text-center"> Items you may also like... </h2>
                    <hr>
                    <g:each var="p" in="${others}">
                        <div class="col-xs-6 col-md-3">
                            <div class="thumbnail">
                                <img class="img-responsive center-block"
                                     src="/product/render_image/${p.id}"
                                     alt="" />
                                <div class="caption">
                                    <h3 class="text-center"><g:link action="show_user" controller="product" id="${p.id}">${p.title}</g:link></h3>
                                    <p class="text-center">${p.description}</p>
                                    <p class="text-center"><b>Price: </b>$ ${p.price}</p>
                                    <p>
                                        <g:link action="show_user" class="btn btn-block btn-success" controller="product" id="${p.id}">Buy Now!</g:link>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </g:each>
                </div>
            </g:if>
        </div>
    </content>
</g:applyLayout>