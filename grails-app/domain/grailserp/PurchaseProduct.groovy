package grailserp

class PurchaseProduct {
    int quantity
    BigDecimal price

    static belongsTo = [product: Product, purchase: Purchase]

    static constraints = {
    }
}
