package grailserp

class User implements Serializable {

    transient springSecurityService

    String name
    String lastname
    String state
    String city
    String address
    String zip
    String email
    String password
    String userType
    boolean isAdmin = false
    boolean enabled = true
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired

    Date dateCreated
    Date lastUpdated

    static hasOne = [department: Department]
    static hasMany = [carts: Cart, purchases: Purchase]

    static constraints = {
        name blank: false
        lastname blank: false
        address nullable: true
        city nullable: true
        zip nullable: true
        state nullable: true
        email email: true, blank: false, unique: true
        password blank: false, display: false
        userType nullable: true
        purchases display: false
        carts display: false
        enabled display: false
        accountExpired display: false
        accountLocked display: false
        passwordExpired display: false
    }

    Set<Role> getAuthorities() {
        UserRole.findAllByUser(this)*.role
    }

    def addRole(role) {
        def ur = new UserRole(role: role, user: this)
        ur.save()
    }

    def beforeInsert() {
        encodePassword()
    }

    def beforeUpdate() {
        if (isDirty('password')) {
            encodePassword()
        }
    }

    protected void encodePassword() {
        password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
    }

    static transients = ['springSecurityService']


    static mapping = {
        department joinTable: [name: 'DepartmentUsers', key: 'user_id']
        password column: '`password`'
        purchases cascade: 'all-delete-orphan'
    }

    @Override
    String toString() {
        return name + " " + lastname
    }
}
