package grailserp

class Cart {

    int quantity
    Date dateCreated
    Date lastUpdated

    static belongsTo = [User, Product]

    static constraints = {
        quantity blank:false
    }
}
