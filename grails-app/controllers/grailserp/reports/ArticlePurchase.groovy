package grailserp.reports

import grailserp.Purchase

class ArticlePurchase {
    String id
    String title
    String quantity
    String price
    String total

    static ArrayList<ArticlePurchase> getArticlesFromPurchase(Purchase purchase) {
        def list = []
        purchase.products.each { p ->
            def ap = new ArticlePurchase(id: p.product.id,
                    title: p.product.title,
                    quantity: "${p.quantity}",
                    price: "\$${p.price}",
                    total: "\$${p.price * p.quantity}"
            )

            list.add(ap)
        }

        list
    }
}