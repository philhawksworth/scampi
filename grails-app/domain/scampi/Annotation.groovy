package scampi

import java.util.Date

class Annotation {

	String name
	String description
	double x
	double y
	Date dateCreated
	Date lastUpdated
	
	static belongsTo = [page:Page]

    static constraints = {
    }

	public String toString(){
		return name
	}
}
