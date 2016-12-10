<g:applyLayout name="bootstrapTemplate">
    <content tag="banner">
        <div class="jumbotron text-center">
            <h1>Grails ERP</h1>
            <hr>
            <h3>Welcome!</h3>
        </div>
    </content>
    <content tag="body">
        <h1 class="text-center">Featured Products</h1>
        <hr>

        <g:if test="${products || products.size() > 0}">
            <exa:datatable id="product-table"
                           items="${products}"
                           hidden="id,productImage,imageType,title,description,price,quantity"
                           add="custom"
                           exclude="lastUpdated,dateCreated,hasMany,purchases" filtering="false" ordering="false" infos="false">
                <exa:customHeader name="custom" value="Product" />
                <exa:customColumn name="custom">
                    <div class="col-xs-3">
                        <img class="img-responsive img-rounded center-block"
                             src="/product/render_image/${it.id}"
                             alt="" />
                    </div>
                    <div class="col-xs-9">
                        <h2><a href="/product/show_user/${it.id}" class="product-title">${it.title}</a></h2>
                        <h1 class="product-price">${it.price}</h1>
                        <p class="product-description">${it.description}</p>
                    </div>
                </exa:customColumn>
            </exa:datatable>
        </g:if>
        <g:else>
            <h3 class="text-center">There are no products available</h3>
        </g:else>

        <div id="product-container" hidden>
            <div class="container">
                <div class="row" style="padding: 8px">
                    <div class="col-lg-3">
                        <img class="img-responsive center-block"
                             src=""
                             alt="" />
                    </div>
                    <div class="col-lg-9">
                        <h2><a href="#" class="product-title"></a></h2>
                        <h1 class="product-price"></h1>
                        <p class="product-description"></p>
                    </div>
                </div>
                <hr />
            </div>
        </div>
    </content>
</g:applyLayout>