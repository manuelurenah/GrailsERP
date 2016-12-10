package grailserp

class Cart {

    int quantity
    Date dateCreated
    Date lastUpdated

    static belongsTo = [user: User, product: Product]
    static constraints = {
        quantity blank:false

    }
}
