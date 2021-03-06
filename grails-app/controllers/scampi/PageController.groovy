package scampi

class PageController {

	def imageService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [pageInstanceList: Page.list(params), pageInstanceTotal: Page.count()]
    }

    def create = {
        def pageInstance = new Page()
        pageInstance.properties = params
        return [pageInstance: pageInstance]
    }

    def save = {
        def pageInstance = new Page(params)
		def imageUri = imageService.saveImage(request)
		pageInstance.imageUri = imageUri
        if (pageInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'page.label', default: 'Page'), pageInstance.id])}"
			Project project = Project.get(params.project.id)
            redirect(uri:"/project/${project.name}/${pageInstance.id}")
        }
        else {
            render(view: "create", model: [pageInstance: pageInstance])
        }
    }

    def show = {
        def page = Page.get(params.id)
        if (!page) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'page.label', default: 'Page'), params.id])}"
            redirect(action: "list")
        }
        else {
            [page: page]
        }
    }

    def edit = {
        def pageInstance = Page.get(params.id)
        if (!pageInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'page.label', default: 'Page'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [pageInstance: pageInstance]
        }
    }

    def update = {
        def pageInstance = Page.get(params.id)
        if (pageInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (pageInstance.version > version) {
                    
                    pageInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'page.label', default: 'Page')] as Object[], "Another user has updated this Page while you were editing")
                    render(view: "edit", model: [pageInstance: pageInstance])
                    return
                }
            }
            pageInstance.properties = params
            if (!pageInstance.hasErrors() && pageInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'page.label', default: 'Page'), pageInstance.id])}"
                redirect(action: "show", id: pageInstance.id)
            }
            else {
                render(view: "edit", model: [pageInstance: pageInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'page.label', default: 'Page'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def pageInstance = Page.get(params.id)
        if (pageInstance) {
            try {
                pageInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'page.label', default: 'Page'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'page.label', default: 'Page'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'page.label', default: 'Page'), params.id])}"
            redirect(action: "list")
        }
    }
}
