package grailserp
import grailserp.Product
import grailserp.User


class Purchase {

    boolean isVerified = false// Confirms the user received the order.
    boolean isProcessed= false // Confirms order was processed.
    boolean emailSent = false// Email sent to guys.
    int notation = 0 //Will work as fiscal proof.
    BigDecimal total
    String txnId

    Date dateCreated
    Date lastUpdated

    static belongsTo = [user: User]
    static hasMany = [products: PurchaseProduct]

    static constraints = {

    }


}

