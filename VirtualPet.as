package zoo { 
	import flash.utils.setInterval;
	import flash.utils.clearInterval;
		
	internal class VirtualPet { 
		private static var maxNameLength = 20; 
		private static var maxCalories = 2000; 
		private static var caloriesPerSecond = 100; 
		private var petName; 
		private var currentCalories = VirtualPet.maxCalories/2; 
		private var digestlntervallD; 
		
		public function VirtualPet (name) { 
			setName(name); 
			digestlntervalID = setlnterval(digest, 1000); 
		} 
		
		public function eat (foodltem) { 	
		  if (currentCalories == 0) { 
		    trace(getName( ) + " is dead. You can't feed it."); 
			return; 
		} 
	if (foodltem is Apple) { 
	  if (foodltem.hasWorm( )) { 
	   trace("The " + foodltem.getName( ) + " had a worm.." + getName( ) 
	   + " didn't eat it."); 
     return; 
  	} 
} 

var newCurrentCalories = currentCalories + foodItem.getCalories( ); 
if (newCurrentCalories > VirtualPet.maxCalories) { 
  currentCalories = VirtualPet.maxCalories; 
} else { 
  currentCalories = newCurrentCalories; 
} 
trace(getName( ) + " ate some " + foodItem.getName( ) + "." 
  + " It now has " + currentCalories + " calories remaining."); 
} 

public function getHunger ( ) { 
 return currentCalories / VirtualPet.maxCalories; 
} 
public function setName (newName) { 
  // Если длина заданного нового имени больше maxNameLength символов... 
  if (newName.length > VirtualPet.maxNameLength) { 
  // ...обрезать имя 
  newName = newName.substr(0, VirtualPet.maxNameLength); 
} else if (newName == "") { 
  // ...в противном случае, если заданное новое имя является 
  // пустой строкой, завершить выполнение метода, не изменяя 
  // значения переменной petName 
  return; 
} 
  // Присвоить новое проверенное имя переменной petName 
 petName = newName; 
} 
public function getName ( ) { 
  return petName; 
} 
private function digest ( ) { 
   // Если в результате потребления очередной порции калорий 
   // значение переменной currentCalories животного 
   // станет равным 0 или меньше... 
   if (currentCalories - VirtualPet.caloriesPerSecond <= 0) { 
     // ...прекратить вызов метода digest( ) 
    clearlnterval(digestlntervalID); 
     // После чего очистить желудок животного 
    currentCalories = 0; 
    // и сообщить о смерти животного 
   trace(getName( ) + " has died."); 
} else { 
       // ...иначе употребить оговоренное количество калорий 
       currentCalories -= VirtualPet.caloriesPerSecond; 
       
	   // и сообщить о новом состоянии животного 
       trace(getName( ) + " digested some food. It now has " 
           + currentCalories + " calories remaining."); 
      } 
    } 
  } 
} 



