package scampi

import java.util.Date

class Project {

	String name
	Date dateCreated
	Date lastUpdated
	
	static hasMany = [pages:Page]

    static constraints = {
		name(unique:true)
    }

	public String toString(){
		return name
	}
}
