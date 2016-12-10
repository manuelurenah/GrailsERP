package grailserp

import org.apache.commons.beanutils.converters.BigDecimalConverter

import static org.springframework.http.HttpStatus.*

class PurchaseController {

    def springSecurityService

    def index() {
        def user = User.get(springSecurityService.currentUser.id)
        [user: user]
    }

    def save_purchase = {
        def user = User.get(springSecurityService.currentUser.id)
        println "---------------------- TEST --------------------"
        def total = new BigDecimal(params.payment_gross)
        println total
        println params.txn_id
        def purchase = new Purchase(
                txnId: params.txn_id,
                user:user,
                total: total,
                address: params.address_street,
                city: params.address_city,
                zip: params.address_zip,
                state: params.address_state
        )
        purchase.save(failOnError: true, flush: true)

        user.purchases.add(purchase)
        user.save(failOnError: true, flush: true)
        purchase.products = []
        user.carts.each { cart ->
            // let's add this to purchases:
            def pp = new PurchaseProduct(
                    price: cart.product.price,
                    product: cart.product,
                    quantity: cart.quantity,
                    purchase: purchase)
            pp.save(failOnError: true, flush: true)
            purchase.products.add(pp)
        }
        purchase.save()
        println purchase.products
        user.carts.each{
            user.carts.remove(it)
            it.delete();
        }
        [purchase: purchase, user: user]

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
