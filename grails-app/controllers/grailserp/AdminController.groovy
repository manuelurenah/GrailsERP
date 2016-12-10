package grailserp

import org.springframework.security.access.annotation.Secured

class AdminController {

    @Secured(['ROLE_ADMIN','ROLE_SALES'])
    def index() {
        def myDailyActivitiesColumns = [['string', 'Task'], ['number', 'Hours per Day']]
        def myDailyActivitiesData = [['Work', 11], ['Eat', 2], ['Commute', 2], ['Watch TV', 2], ['Sleep', 7]]
        def purchases = Purchase.list(params)
        [myDailyActivitiesColumns: myDailyActivitiesColumns,
         myDailyActivitiesData: myDailyActivitiesData,
         purchases: purchases]
    }

    // Used for the mobile app.
    @Secured(['ROLE_ADMIN'])
    def datatable(){
        def purchases = Purchase.list()
        [purchases: purchases]
    }
}
