package grailserp

import static org.springframework.http.HttpStatus.*

class PurchaseController {

    def springSecurityService

    def index() {
        def user = User.get(springSecurityService.currentUser.id)

        [user: user]
    }

    def save = {
        def user = User.get(springSecurityService.currentUser.id)

        def purchase = new Purchase()

        user.purchases.add(purchase)
        user.save(failOnError: true, flush: true)

        redirect controller: 'home', action: 'index'
    }

}
