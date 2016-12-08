<g:applyLayout name="bootstrapTemplate">
    <content tag="banner">
        <div class="jumbotron text-center">
            <h1>Products</h1>
        </div>
    </content>

    <content tag="body">
        <div class="row">
            <div class="col-xs-3">
                <a class="btn btn-md btn-primary" href="/product/create">Add New Product</a>
            </div>
        </div>
        <br />

        <div class="row">
            <div class="col-xs-12">
                <div id="list-product" class="content scaffold-list" role="main">
                    <g:if test="${flash.message}">
                        <div class="message" role="status">${flash.message}</div>
                    </g:if>
                    <exa:datatable id="productTable" items="${productList}"
                                   hidden="dateCreated,description,lastUpdated"
                                    reorder="id,title,price,quantity">
                        <exa:customHeader name="id" value="Identifier"/>
                        <exa:customHeader name="title" value="Title"/>
                        <exa:customHeader name="price" value="Price"/>
                        <exa:customHeader name="quantity" value="Quantity"/>

                    </exa:datatable>
                </div>
            </div>
        </div>
    </content>
</g:applyLayout>