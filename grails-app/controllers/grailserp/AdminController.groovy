package grailserp

import org.springframework.security.access.annotation.Secured

class AdminController {

    @Secured(['ROLE_ADMIN','ROLE_SALES'])
    def index() {
        def now = new Date().clearTime()
        def todayPurchases = Purchase.countByDateCreatedBetween(now, now+1)
        def todayValidPurchases = Purchase.countByDateCreatedBetweenAndIsVerified(now, now+1, true)
        def todayPending = Purchase.countByDateCreatedBetweenAndIsVerified(now, now+1, false)

        def myDailyActivitiesColumns = [['string', 'Action'], ['number', 'Quantity']]
        def myDailyActivitiesData = [['Orders', todayPurchases],
                                     ['Delivered Orders', todayValidPurchases],
                                     ['Pending', todayPending]]
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
