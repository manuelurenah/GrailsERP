package grailserp

import static org.springframework.http.HttpStatus.*

class DepartmentController {

    def index = {
        List<Department> departments = Department.list()
        [departmentList: departments, departmentCount: Department.count()]
    }

    def create = {}

    def save = {
        Department department = new Department(params)

        if (department == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (department.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond department.errors, view:'create'
            return
        }

        department.save(failOnError: true, flush: true)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'department.label', default: 'Department'), department])
                redirect department
            }
            '*' { respond department, [status: CREATED] }
        }
    }

    def edit = {
        Department department = Department.get(params.id)
        [department: department]
    }

    def update = {
        Department department = Department.get(params.id)

        if (department == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (department.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond department.errors, view:'edit'
            return
        }

        department.properties = params
        department.save(failOnError: true, flush: true)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'department.label', default: 'Department'), department])
                redirect department
            }
            '*'{ respond department, [status: OK] }
        }
    }

    def show = {
        Department department = Department.get(params.id)
        [department: department]
    }

    def delete = {
        Department department = Department.get(params.id)

        if (department == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        department.delete(failOnError: true, flush: true)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'department.label', default: 'Department'), department])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'department.label', default: 'Department'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
    
}
