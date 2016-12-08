package grailserp

class User implements Serializable {
    private static final long serialVersionUID = 1

    transient springSecurityService

    String name
    String lastname
    String email
    String password
    String userType
    Boolean isAdmin
    boolean enabled = true
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired


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

    }

    @Override
    String toString() {
        return name + " " + lastname
    }
}
