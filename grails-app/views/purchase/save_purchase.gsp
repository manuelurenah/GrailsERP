<g:applyLayout name="bootstrapTemplate">
    <content tag="banner">
        <div class="jumbotron text-center">
            <h1>Purchase Completed!</h1>
        </div>
    </content>
    <content tag="body">
        <div id="show-purchase" class="content scaffold-show" role="main">
            <div class="row">
                <div class="col-xs-12">
                    <h1 class="text-center">Congratulations! You've completed your purchase</h1>
                    <p class="text-center">You may now review your purchase and download your invoice if you like</p>
                    <a href="${g.createLink(controller:'reports', action: "generate_invoice", id: purchase.id)}"
                    class="btn btn-success center-block"> Download Invoice   </a>
                </div>
            </div>
            <hr>
            <div class="row">
                <div class="col-xs-12">
                    <h3> Purchased Items </h3>
                    <table class="table table-striped">
                        <thead>
                            <th>Item</th>
                            <th>Quantity</th>
                            <th>Price</th>
                            <th>Total</th>
                        </thead>
                        <tbody>
                            <g:each var="p" in="${products}">
                                <tr>
                                    <td>
                                        <a href="${g.createLink(controller: "product", action:"show_product", id:p.product.id)}">
                                            ${p.product.title}
                                        </a>
                                    </td>
                                    <td>
                                        ${p.quantity}
                                    </td>
                                    <td>
                                        $${p.price}
                                    </td>
                                    <td>
                                        $${p.price * p.quantity}
                                    </td>
                                </tr>
                            </g:each>
                        </tbody>
                    </table>

                    <hr>
                    <h3 class="text-center">Total: $${purchase.total}</h3>
                </div>
            </div>
        </div>
    </content>
</g:applyLayout>