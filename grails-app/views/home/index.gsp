<g:applyLayout name="bootstrapTemplate">
    <content tag="banner">
        <div class="jumbotron text-center">
            <h1>Grails ERP</h1>
            <hr>
            <h3>Welcome!</h3>
        </div>
    </content>
    <content tag="body">
        <g:if test="${products.size() == 0}">
            <div class="col-lg-12 text-center">
                <h2>There are no products available at the moment</h2>
            </div>
        </g:if>
        <g:else>
            <h1 class="text-center">Featured Products</h1>
            <hr>
            <div class="row">
            <g:each var="p" in="${products}">
                <div class="col-sm-6 col-md-4">
                    <div class="thumbnail">
                        <img class="img-responsive center-block"
                             src="https://getuikit.com/docs/images/placeholder_600x400.svg"
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
        </g:else>
    </content>
</g:applyLayout>