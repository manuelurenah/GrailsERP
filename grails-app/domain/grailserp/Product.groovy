package grailserp

class Product {

    byte[] productImage
    String imageType
    String title
    String description
    BigDecimal price
    Integer quantity

    Date dateCreated
    Date lastUpdated

    static constraints = {
        title blank: false
        description nullable: true
        price blank: false
        quantity blank: false
        productImage nullable: true, display: false, maxSize: 20971520
        imageType nullable: true, display: false
    }

    static hasMany = [purchases: PurchaseProduct]

    @Override
    String toString() {
        return title
    }
}
