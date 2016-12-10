package grailserp

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
        "/api/datatable/"(controller: 'admin', action: 'datatable')
        "/"(controller: 'home', action: 'index')
        "/error"(view:'/error')
        "500"(view:'/error')
        "404"(view:'/notFound')

    }
}
