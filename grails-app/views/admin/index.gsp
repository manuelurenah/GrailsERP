<g:applyLayout name="bootstrapTemplate">
    <content tag="header">
        <gvisualization:apiImport />
    </content>
    <content tag="body">
        <div class="jumbotron text-center">
            <h1>Charts and Statistics</h1>
        </div>
        <g:if test="${!myDailyActivitiesData || myDailyActivitiesData.size() == 0}">
            <div class="col-xs-12 text-center">
                <h2>There is no data to show.</h2>
            </div>
        </g:if>
        <g:else>
            <gvisualization:pieCoreChart dynamicLoading="${true}"
                                         elementId="piechart"
                                         title="My Daily Activities"
                                         width="${450}" height="${300}"
                                         columns="${myDailyActivitiesColumns}"
                                         data="${myDailyActivitiesData}" />

            <div id="piechart" class="col-xs-6"></div>
        </g:else>
    </content>
</g:applyLayout>