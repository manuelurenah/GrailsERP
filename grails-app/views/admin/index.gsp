<g:applyLayout name="bootstrapTemplate">
    <content tag="header">
        <gvisualization:apiImport />
    </content>
    <content tag="banner">
        <div class="jumbotron text-center">
            <h1>Charts and Statistics</h1>
            <hr>
        </div>
    </content>
    <content tag="body">

        <g:if test="${!myDailyActivitiesData || myDailyActivitiesData.size() == 0}">
            <div class="col-xs-12 text-center">
                <h2>There is no data to show.</h2>
            </div>
        </g:if>
        <g:else>
            <gvisualization:barCoreChart dynamicLoading="${true}"
                                         elementId="piechart"
                                         title="Today's Orders Overview"
                                         width="${'100%'}" height="${300}"
                                         columns="${myDailyActivitiesColumns}"
                                         data="${myDailyActivitiesData}" />

            <div id="piechart" class="col-xs-12"></div>
        </g:else>

        <g:if test="${purchases && purchases.size() > 0}">
            <exa:datatable id="purchases" items="${purchases}"
                include="id,user,total"
            >
                <exa:customHeader name="id" value="Action"/>
                <exa:customHeader name="user" value="User who made the purchase"/>
                <exa:customHeader name="total" value="Total"/>

                <exa:customColumn name="id">
                    <a href="${g.createLink(controller: "purchase", action:"show", id:it.id)}">Go To Purchase</a>
                </exa:customColumn>
                <exa:customColumn name="user">
                    ${it.user.email}
                </exa:customColumn>
                <exa:customColumn name="total">
                    $${it.total}
                </exa:customColumn>
            </exa:datatable>
        </g:if>
    </content>
</g:applyLayout>