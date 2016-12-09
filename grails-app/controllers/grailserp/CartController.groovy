package grailserp

import static org.springframework.http.HttpStatus.*

class CartController {
    def springSecurityService
    def index() {

        def user = User.findById(springSecurityService.currentUser.id)

        BigDecimal cartTotal = 0.0

        user.carts.each {cart ->
            cartTotal += cart.product.price * cart.quantity
        }

        [cart: user.carts, total: cartTotal]
    }

    def add() {
        def user = springSecurityService.currentUser
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

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'product.label', default: 'Product'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
