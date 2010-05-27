package scampi

import java.util.Date

class Page {

	String name
	String description
	String imageUri
	byte[] image
	Date dateCreated
	Date lastUpdated
	
	static belongsTo = [project:Project]
	static hasMany = [annotations:Annotation]
	static transients = ['image']

    static constraints = {
    }

	public String toString(){
		return name
	}
}
