package grailserp

import static org.springframework.http.HttpStatus.*

class PurchaseController {

    def springSecurityService

    def index() {
        def user = User.get(springSecurityService.currentUser.id)
        [user: user]
    }

    def save_purchase = {
        def user = User.get(springSecurityService.currentUser.id)
        def purchase = new Purchase(txnId: params.txn_id, user:user, total: params.payment_gross)
        purchase.save(failOnError: true, flush: true)

        user.purchases.add(purchase)
        user.save(failOnError: true, flush: true)
        user.carts.each { cart ->
            // let's add this to purchases:
            def pp = new PurchaseProduct(
                    price: cart.product.price,
                    product: cart.product,
                    quantity: cart.quantity,
                    purchase: purchase)
            pp.save(failOnError: true, flush: true)
        }
        purchase.save()
        user.carts.each{
            user.carts.remove(it)
            it.delete();
        }
        redirect controller: 'home', action: 'index'
    }

    def list = {
        User current = User.get(springSecurityService.currentUser.id)
        def purchases = null
        if (current.isAdmin) {
            purchases = Purchase.list()
        } else {
            purchases = Purchase.findAllByUser(current)
        }

        [purchaseList: purchases]
    }

}
