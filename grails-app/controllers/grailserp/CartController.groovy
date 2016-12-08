package grailserp

class CartController {

    def index() {
        def user = session.currentUser
        [cart: user.carts]
    }

    def add() {
        def user = session.currentUser
        def product = Product.findById(params.product)

        if (product == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        def cart = new Cart(product: product, user: user, quantity: params.quantity)

        if (cart.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond "ERROR"
            return
        }

        cart.save(failOnError: true, flush: true)
        redirect controller: "cart", action: "index"
    }
}
