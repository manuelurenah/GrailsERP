package grailserp

import static org.springframework.http.HttpStatus.*

class ProductController {

    def index = {
        List<Product> products = Product.list()
        [productList: products, productCount: Product.count()]
    }

    def create = { }

    def save = {
        Product product = new Product(params)

        if (product == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (product.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond product.errors, view:'create'
            return
        }

        product.save(failOnError: true, flush: true)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'product.label', default: 'Product'), product])
                redirect product
            }
            '*' { respond product, [status: CREATED] }
        }
    }

    def edit = {
        Product product = Product.get(params.id)
        [product: product]
    }

    def update = {
        Product product = Product.get(params.id)

        if (product == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (product.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond product.errors, view:'edit'
            return
        }

        product.properties = params
        product.save(failOnError: true, flush: true)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'product.label', default: 'Product'), product])
                redirect product
            }
            '*'{ respond product, [status: OK] }
        }
    }

    def show = {
        Product product = Product.get(params.id)
        [product: product]
    }

    def delete = {
        Product product = Product.get(params.id)

        if (product == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        product.delete(failOnError: true, flush: true)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'product.label', default: 'Product'), product])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
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
