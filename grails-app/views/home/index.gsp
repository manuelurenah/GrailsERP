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

        <div class="row">
            <div class="col-xs-12">
                <table id="products-table" class="table table-responsive table-hover">
                    <thead><th></th></thead>
                    <tbody></tbody>
                </table>
            </div>
        </div>

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