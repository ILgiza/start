package zoo { 
  public class Food { 
	private var calories:int;
	private var nameString; 
	public function Food (initialCalories^int) { 
	setCalories(initialCalories); 
	} 
	public function getCalories ( ):int { 
	return calories; 
	} 
	public function setCalories (newCalories:int):void { 
	calories = newCalories; 
	}	 
	public function getName ( ):String { 
	return name; 
	} 
	public function setName (newName:String):void { 
	  name = newName; 
	} 
  } 
} 
