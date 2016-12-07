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
    }

    def destroy = {
    }
}
