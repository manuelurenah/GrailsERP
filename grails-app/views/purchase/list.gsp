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
                                       reorder="id,user,total,dateCreated,isVerified,isProcessed"
                                       hidden="txnId,notation,lastUpdated,belongsTo,emailSent,products,hasMany" >
                            <exa:customHeader name="id" value="Identifier"/>
                            <exa:customHeader name="user" value="Client"/>
                            <exa:customHeader name="total" value="Total"/>
                            <exa:customHeader name="dateCreated" value="Purchase Date"/>
                            <exa:customHeader name="isVerified" value="Verified"/>
                            <exa:customHeader name="isProcessed" value="Processed"/>
                            <exa:customColumn name="user">
                                ${it.user}
                            </exa:customColumn>

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