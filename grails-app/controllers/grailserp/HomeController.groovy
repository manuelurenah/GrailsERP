package grailserp

import org.springframework.security.access.annotation.Secured

class HomeController {

    @Secured(['ROLE_USER'])
    def index() {
        List<Product> productList = Product.list()
        [products: productList]
    }
}
