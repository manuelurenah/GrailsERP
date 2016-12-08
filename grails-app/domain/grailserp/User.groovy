package grailserp

class User {

    String name
    String lastname
    String email
    String password
    String userType
    Boolean isAdmin

    Date dateCreated
    Date lastUpdated

    static hasOne = [department: Department]
    static hasMany = [carts: Cart]

    static constraints = {
        name blank: false
        lastname blank: false
        email email: true, blank: false, unique: true
        password blank: false
        userType nullable: true
        isAdmin nullable: true
    }

    static mapping = {
        department joinTable: [name: 'DepartmentUsers', key: 'user_id']
    }

    @Override
    String toString() {
        return name + " " + lastname
    }
}
