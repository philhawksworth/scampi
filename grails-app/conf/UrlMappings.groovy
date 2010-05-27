class UrlMappings {
    static mappings = {

	  "/project/${id}"(controller:'project', action:'show')
	  "/project/${projectname}/${id}"(controller:'page', action:'show')
      "/"(controller:'homepage', action:'index')
	  "500"(view:'/error')
	
	  "/$controller/$action?/$id?"{
	      constraints {
			 // apply constraints here
		  }
	  }
	
	}
}
