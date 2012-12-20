package zoo { 
  public class Apple extends Food { 
	private static var DEFAULT_CALORIES:int = 100; 
	private var wormlnApple:Boolean:

	public function Apple (initialCalories:int = 0) { 
	 if (initialCalories <= 0) { 
	initialCalories = Apple.DEFAULT_CALORIES; 
   } 
	super(initialCalories); 
	wormlnApple = Math.random( ) >= .5; 	
	setName("Apple"); 
  } 
	public function hasWorm ( ):Boolean { 
	 return wormlnApple; 
	} 
  } 
} 