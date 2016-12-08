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
            <g:each var="p" in="${products}">
                <div class="row" style="padding: 8px">
                    <div class="col-lg-3">
                        <img class="img-responsive center-block"
                             src="https://getuikit.com/docs/images/placeholder_600x400.svg"
                             alt="" />
                    </div>
                    <div class="col-lg-9">
                        <h2><a href="#">${p.title}</a></h2>
                        <h1>$ ${p.price}</h1>
                        <p>${p.description}</p>
                    </div>
                </div>
                <hr />
            </g:each>
        </g:else>
    </content>
</g:applyLayout>