package grailserp

import static org.springframework.http.HttpStatus.*

class UserController {

    def springSecurityService

    def index = {
        List<User> users = User.list()
        [userList: users, userCount: User.count()]
    }

    def login() {
        render view: "login", model: [error: params.error == '1']
    }

    def processLogin(String email, String password) {
        def currentUser = User.findByEmailAndPassword(email, password)
        if (currentUser == null) {
            flash.error = "El usuario con el que intenta autenticarse no existe."
            redirect action: "login"
        } else {
            session.currentUser = currentUser
            redirect uri: "/"
        }
    }

    def logout() {
        session.currentUser = null
        redirect uri: "/"
    }

    def create = {}

    def save = {
        User user = new User(params)

        if (user == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (user.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond user.errors, view:'create'
            return
        }

        user.save(failOnError: true, flush: true)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), user])
                redirect user
            }
            '*' { respond user, [status: CREATED] }
        }
    }

    def edit = {
        User user = User.get(params.id)
        [user: user]
    }

    def update = {
        User user = User.get(params.id)

        if (user == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (user.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond user.errors, view:'edit'
            return
        }

        user.properties = params
        user.save(failOnError: true, flush: true)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), user])
                redirect user
            }
            '*'{ respond user, [status: OK] }
        }
    }

    def show = {
        User user = User.get(params.id)
        [user: user]
    }

    def delete = {
        User user = User.get(params.id)

        if (user == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        user.delete(failOnError: true, flush: true)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), user])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

}
