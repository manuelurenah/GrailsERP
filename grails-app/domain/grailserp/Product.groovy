package grailserp

class Product {

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
    }

    @Override
    String toString() {
        return title
    }
}
