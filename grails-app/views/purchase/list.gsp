<g:applyLayout name="bootstrapTemplate">
    <content tag="banner">
        <div class="jumbotron text-center">
            <h1>Purchases</h1>
        </div>
    </content>

    <content tag="body">
        <div class="row">
            <div class="col-xs-12">
                <div id="list-purchases" class="content scaffold-list" role="main">
                    <g:if test="${flash.message}">
                        <div class="message" role="status">${flash.message}</div>
                    </g:if>
                    <g:if test="${purchaseList && purchaseList.size() > 0}">
                        <exa:datatable id="purchasetable" items="${purchaseList}"
                                       add="invoice"
                                       hidden="txnId,notation,lastUpdated,belongsTo,isProcessed,emailSent,products,hasMany,address,city,zip,state"
                                       reorder="id,user,total,dateCreated,isVerified,invoice">
                            <exa:customHeader name="id" value="Identifier"/>
                            <exa:customHeader name="invoice" value="Invoice"/>
                            <exa:customHeader name="user" value="Client"/>
                            <exa:customHeader name="total" value="Total"/>
                            <exa:customHeader name="dateCreated" value="Purchase Date"/>
                            <exa:customHeader name="isVerified" value="Verified"/>
                            <exa:customHeader name="isProcessed" value="Processed"/>
                            <exa:customColumn name="user">
                                ${it.user}
                            </exa:customColumn>
                            <exa:customColumn name="invoice">
                                <a class="btn btn-success"
                                   href="${g.createLink(controller:"reports", action:"generate_invoice", id:it.id)}">
                                    Download Invoice
                                </a>
                            </exa:customColumn>
                            <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_SALES,ROLE_SUPPLY">
                                <exa:customColumn name="isVerified">
                                    <g:if test="${it.isVerified}">
                                        <button class="btn center-block btn-primary" disabled>Order Received</button>
                                    </g:if>
                                    <g:else>
                                        <a class="btn btn-success center-block"
                                           href="${g.createLink(controller:"purchase", action:"receive", id:it.id)}">
                                            Mark as Received
                                        </a>
                                    </g:else>
                                </exa:customColumn>
                            </sec:ifAnyGranted>
                        </exa:datatable>
                    </g:if>
                    <g:else>
                        <h3 class="text-center">You haven't done any purchases<br />Got and get some stuff!</h3>
                    </g:else>
                </div>
            </div>
        </div>
    </content>
</g:applyLayout>