/*
 * FamilyTree - Family tree modeling software 
 * created for research purposes
 * Copyright - Helsinki Univerity of Technology, 
 * Software Business and Engineering Institute
 * Created on 23.7.2003
 */
package familytree.model;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Iterator;

import javax.swing.JOptionPane;

public class RelationSpouse extends Relation {
    public Person husband;
    public Person wife;
    
    public RelationSpouse (Person husband, Person wife)
    {
        this.husband = husband;
        this.wife = wife;
    }
      
    public Person getHusband() {
        return husband;
    }
    
    public Person getWife() {
        return wife;
    }
    
    public Person getPerson1(){
        return getWife();
    }
    
    public Person getPerson2(){
        return getHusband();
    }
    
    public boolean equals(Object obj){
        if (obj instanceof RelationSpouse){
            RelationSpouse relation = (RelationSpouse) obj;
            return (this.getHusband().equals(relation.getHusband())&&
                    this.getWife().equals(relation.getWife()));
            
        }
        return false;
    }
    
    public Person getPartner(Person person){
        if (person.equals(husband))
            return wife;
        else if (person.equals(wife))
            return husband;
        else{
        	JOptionPane.showMessageDialog(null, "Wrong person type for spouse relationship...");
            return null;
        }
    }
    
    public String getRelationType(Person person){
        if (person.equals(husband))
            return WIFE;
        else if (person.equals(wife))
            return HUSBAND;
        else{
        	JOptionPane.showMessageDialog(null, "Wrong person type for spouse relationship...");
			return INVALID_RELATIONSHIP;
        }
    }
    
    public void printToFile(File f)throws IOException{
    	FileWriter fw = new FileWriter(f, false);
    	fw.write("*** Outputting RelationSpouse ***\n");
    	fw.write("Husband: "+husband.getFirstName()+husband.getLastName()+"("+husband.getId()+")\n");
    	fw.write("Wife: "+wife.getFirstName()+wife.getLastName()+"("+wife.getId()+")\n");
    	Iterator it = husband.getChildren().iterator();
    	while (it.hasNext()) {
			Person child = (Person) it.next();
			if (child.getGender().equals(Person.GENDER_FEMALE))
				fw.write("	Daughter: "+child.getFirstName()+"\n");
			else if (child.getGender().equals(Person.GENDER_MALE))
				fw.write("	Son: "+child.getFirstName()+"\n");
			
		}
    	fw.close();
    }
}

//================================================================//


/*
 * FamilyTree - Family tree modeling software 
 * created for research purposes
 * Copyright - Helsinki Univerity of Technology, 
 * Software Business and Engineering Institute
 * Created on 23.7.2003
 */
package familytree.model;

public class RelationParentChild extends Relation {
    private Person child;
    private Person parent;
    
    public RelationParentChild (Person child, Person parent){
        this.child = child;
        this.parent = parent; 	
    }
       
    public boolean isParent(Person person){
        return person == parent;
    }
    
    public boolean isChild(Person person){
        return person == child;
    }
    
    public Person getChild() {
        return child;
    }
    
    public Person getParent() {
        return parent;
    }
    
    public Person getPerson1(){
        return getParent();
    }
    
    public Person getPerson2(){
        return getChild();
    }
    
    public boolean equals(Object obj){
        if (obj instanceof RelationParentChild) {
            RelationParentChild relation = (RelationParentChild) obj;
            return (this.getChild().equals(relation.getChild()) && 
                    this.getParent().equals(relation.getParent()));
        }
        return false;
    }
    
    public Person getPartner(Person person){
        if (person.equals(child))
            return parent;
        else if (person.equals(parent))
            return child;
        else
            return null;		
    }
    
    public String getRelationType(Person person) {
        if (person.equals(child)) {
            if (parent.isFemale())
                return MOTHER;
            else
                return FATHER;
        } else if (person.equals(parent)) {
            if (child.isFemale())
                return DAUGHTER;
            else
                return SON;
        } else
			return INVALID_RELATIONSHIP;
    }
    
}