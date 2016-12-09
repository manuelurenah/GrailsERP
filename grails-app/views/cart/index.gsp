<g:applyLayout name="bootstrapTemplate">
    <content tag="banner">
        <div class="jumbotron text-center">
            <h1>Your Cart</h1>
        </div>
    </content>
    <content tag="body">
        <g:if test="${!cart || cart.size() == 0}">
            <div class="col-xs-12 text-center">
                <h2>Your cart is empty. <br>Feel free to add some new products!</h2>
            </div>
        </g:if>
        <g:else>
            <div class="row">
                <div class="col-xs-8">
                    <h2>Total: ${total}</h2>
                </div>
                <div class="col-xs-4">
                    <g:link class="btn btn-lg btn-success pull-right " action="index" controller="purchase">
                        Proceed to Checkout
                    </g:link>
                </div>
            </div>
            <g:each var="c" in="${cart}">
                <div class="row" style="padding: 8px">
                    <div class="col-lg-3">
                        <img class="img-responsive center-block"
                             src="/product/render_image/${c.product.id}"
                             alt="" />
                    </div>
                    <div class="col-lg-9">
                        <h1><a href="/product/show_user/${c.product.id}">${c.product.title}</a></h1>
                        <h2>$ ${c.product.price}</h2>
                        <p>Quantity: ${c.quantity}</p>
                        <a href="#">Remove</a>
                    </div>
                </div>
                <hr />
            </g:each>
        </g:else>
    </content>
</g:applyLayout>