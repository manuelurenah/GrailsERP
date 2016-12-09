package grailserp

class Purchase {

    boolean isVerified = false // Confirms the user received the order.
    boolean isProcessed = false
    boolean emailSent = false

    Date dateCreated
    Date lastUpdated

    static belongsTo = [User]
    static constraints = {

    }



}
