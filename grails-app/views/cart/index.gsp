<g:applyLayout name="bootstrapTemplate">
    <content tag="banner">
        <div class="jumbotron text-center">
            <h1>Your Cart</h1>
        </div>
    </content>
    <content tag="body">
        <g:if test="${!cart || cart.size == 0}">
            <div class="col-xs-12 text-center">
                <h2>Your cart is empty. <br>Feel free to add some new products!</h2>
            </div>
        </g:if>
        <g:else>
            <g:each var="c" in="${cart}">
                <div class="row" style="padding: 8px">
                    <div class="col-lg-3">
                        <img class="img-responsive center-block"
                             src="https://getuikit.com/docs/images/placeholder_600x400.svg"
                             alt="" />
                    </div>
                    <div class="col-lg-9">
                        <h2><a href="#">${c.product.title}</a></h2>
                        <h1>$ ${c.product.price}</h1>
                        <p>${c.product.description}</p>
                    </div>
                </div>
                <hr />
            </g:each>
        </g:else>
    </content>
</g:applyLayout>