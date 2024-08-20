package recipe;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "Recipes")
public class Recipe {
	@Id
    @Column(name = "id")
    private int id;
	
    @Column(name = "recipe_name")
    private String recipiename;
    
    @Column(name = "ingredients")
    private String ingredients;
    
    @Column(name = "instructions")
    private String instructions;
    
    @Column(name = "difficulty_level")
    private int difficultylevel;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getRecipiename() {
		return recipiename;
	}

	public void setRecipiename(String recipiename) {
		this.recipiename = recipiename;
	}

	public String getIngredients() {
		return ingredients;
	}

	public void setIngredients(String ingredients) {
		this.ingredients = ingredients;
	}

	public String getInstructions() {
		return instructions;
	}

	public void setInstructions(String instructions) {
		this.instructions = instructions;
	}

	public int getDifficultylevel() {
		return difficultylevel;
	}

	public void setDifficultylevel(int difficultylevel) {
		this.difficultylevel = difficultylevel;
	}
    
    public Recipe(int id,String recipiename,String ingredients,String instructions,int difficultylevel) {
    	super();
    	this.id = id;
    	this.recipiename = recipiename;
    	this.ingredients = ingredients;
    	this.instructions = instructions;
    	this.difficultylevel = difficultylevel;
    }
    
    public Recipe() {
    	super();
    }
}
