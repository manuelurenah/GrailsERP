package grailserp

class Department {

    String title

    Date dateCreated
    Date lastUpdated

    static belongsTo = [role: Role]
    static hasMany = [users: User]

    static constraints = {
        title blank: false, unique: true
        role nullable: true, blank: true
    }

    static mapping = {
        users joinTable: [name: 'DepartmentUsers', key: 'department_id']
    }

    @Override
    String toString() {
        return title
    }
}
