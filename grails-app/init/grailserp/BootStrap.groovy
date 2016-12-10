package grailserp

class BootStrap {

    def init = { servletContext ->
        User admin = new User(name: 'Admin', lastname: 'Admin', email: 'admin@me.com', password: 'admin', isAdmin: true)
        Department salesDept = new Department(title: 'Ventas')
        salesDept.save(failOnError: true, flush: true)
        Department warehouseDept = new Department(title: 'Almacén')
        warehouseDept.save(failOnError: true, flush: true)
        Department adminDept = new Department(title: 'Administración')
        adminDept.save(failOnError: true, flush: true)
        Department genericDept = new Department(title: 'Genérico')
        genericDept.save(failOnError: true, flush: true)

        admin.department = adminDept
        admin.save(failOnError: true, flush: true)
        def roles = ["ROLE_USER", "ROLE_ADMIN", "ROLE_SUPPLY", "ROLE_SALES"]
        roles.each {
            def r = new Role(authority: it)
            r.save()
            switch (it) {
                case "ROLE_USER":
                    genericDept.role = r
                    genericDept.save()
                    break
                case "ROLE_ADMIN":
                    adminDept.role = r
                    genericDept.save()
                    break
                case "ROLE_SUPPLY":
                    warehouseDept.role = r
                    warehouseDept.save()
                    break
                case "ROLE_SALES":
                    salesDept.role = r
                    salesDept.save()
                    break
                default:
                    break
            }
            admin.addRole(r)
        }
    }

    def destroy = {
    }
}
