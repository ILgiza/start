package zoo { 
  public class Apple extends Food { 
	private static var DEFAULT_CALORIES = 100; 
	private var wormlnApple; 

	public function Apple (initialCalories = 0) { 
	 if (initialCalories <= 0) { 
	initialCalories = Apple.DEFAULT_CALORIES; 
   } 
	super(initialCalories); 
	wormlnApple = Math.random( ) >= .5; 	
	setName("Apple"); 
  } 
	public function hasWorm ( ) { 
	 return wormlnApple; 
	} 
  } 
} 