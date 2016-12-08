package grailserp

class HomeController {

    def index() {
        List<Product> productList = Product.list()

        [products: productList]
    }
}
