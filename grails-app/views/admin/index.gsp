<g:applyLayout name="bootstrapTemplate">
    <content tag="header">
        <gvisualization:apiImport />
    </content>
    <content tag="body">
        <div class="jumbotron text-center">
            <h1>Charts and Statistics</h1>
        </div>
        <br />
        <gvisualization:pieCoreChart dynamicLoading="${true}"
                                     elementId="piechart"
                                     title="My Daily Activities"
                                     width="${450}" height="${300}"
                                     columns="${myDailyActivitiesColumns}"
                                     data="${myDailyActivitiesData}" />

        <div id="piechart" class="col-xs-6"></div>
    </content>
</g:applyLayout>