package zoo { 
	internal class VirtualPet { 
	   internal var petName; 
	   private var currentCalories = 1000; 
	   private var creationTime; 
	   
	   public function VirtualPet (name) { 
		this.creationTime = new Date( ); 
		this.petName = name; 
		} 

	  public function eat (numberOfCalories) { 
	    this.currentCalories += numberOfCalories; 
} 
	  public function getAge ( ) { 
	    var currentTime = new Date( ); 
	    var age = currentTime.time - this.creationTime.time; 
	    return age; 
		} 
	} 
} 
