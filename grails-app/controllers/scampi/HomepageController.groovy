package scampi

class HomepageController {

    def index = { 
		[projects:Project.list()]
	}
}
