package zoo { 
	import flash.utils.*;
	import flash.events.*;
	
	public class VirtualPet extends EventDispatcer {
		public static const NAME_CHANGE:String = "NAME CHANGE";
		public static const STATE_CHANGE:String = "STATE_CHANGE"; 
		
		public static const PETSTATE_FULL:int = 0; 
		public static const PETSTATE_HUNGRY:int = 1; 
		public static const PETSTATE_STARVING:int = 2; 
		public static const PETSTATE_DEAD:int = 3; 

		private static var maxNameLength = 20; 
		private static var maxCalories = 2000; 
		private static var caloriesPerSecond = 100; 
		private static var defaultName:String = "Unnamed Pet";
		
		private var petName:String;
		private var currentCalories:int;
		private var petState:int;
		private var digestTimer:Timer;
		public function VirtualPet (name:String):void { 
		setName(name); 
		setCalories(VirtualPet.maxCalories/2); 
		}
		public function start ( ):void { 
		digestTimer = new Timer(1OOO. 0); 
		digestTimer.addEventListener(TimerEvent.TIMER, digestTimerListener); 
		digestTimer.start( ); 
	} 
        public function stop ( ):void { 
		if (digestTimer != null) { 
		digestTimer.stop( ); 
		} 
	} 
	
		
	public function setName (newName:String):void { 
	if (newName. indexOf("") == 0) { 
	throw new VirtualPetNameException( ); 
	} else if (newName == "") { 
	throw new VirtualPetInsufficientDataException( ); 
	} else if (newName.length > VirtualPet.maxNameLength) { 	
	throw new VirtualPetExcessDataException( );
	}
 	petName = newName; 
	dispatchEvent(new Event(VirtualPet.NAME_CHANGE)); 
} 
	public function getName ( ):String { 
	if (petName == null) { 
	   return VirtualPet.defaultName; 
		} else { 
		return petName; 
	} 
}	 
		public function eat (foodItem:Food):void { 
		if (petState == VirtualPet.PETSTATE_DEAD) { 
			trace(getName( ) + " is dead. You can't feed it.");
		return;
} 
		 
	if (foodItem is Apple) { 
	  if (Apple(foodItem).hasWorm( )) { 
	   trace("The " + foodItem.getName( ) + " had a worm.." + getName( ) 
	   + " didn't eat it."); 
     return; 
  	} 
} 
	trace(getName( ) + " ate the " + foodItem.getName( ) 
			+ " (" + foodItem.getCalories( ) + " calories).");
		setCalories(getCalories( ) + foodItem.getCalories( )); 
		}	 
	private function setCalories (newCurrentCalories:int):void { 
		if (newCurrentCalories > VirtualPet.maxCalories) { 
  	currentCalories = VirtualPet.maxCalories: 
		} else if (newCurrentCalories < 0) { 
	currentCalories = 0; 
			} else { 
	currentCalories = newCurrentCalories;
	} 
		var caloriePercentage:int = Math.floor(getHunger( )*100); 

	trace(getName( ) + "has" + currentCalories + "calories" 
  			+ "(" +caloriePercentage +"% of its food) remaining."); 
		if(caloriePercentage == 0) {  
		if (getPetState( ) != VirtualPet.PETSTATE_DEAD) { 
			die( ); 
		}
	} else if (caloriePercentage < 20) { 
	if (getPetState( ) != VirtualPet.PETSTATE_STARVING) { 
	setPetState( VirtualPet. PETSTATE_STARVING); 
	} 
		} else if (caloriePercentage < 50) { 
	if (getPetState( ) != VirtualPet. PETSTATE_HUNGRY) { 
	setPetState(VirtualPet. PETSTATE_HUNGRY); 	
	} 
		} else { 
		if (getPetState( ) != VirtualPet. PETSTATE_FULL) { 
	setPetState(VirtualPet.PETSTATE_FULL) ; 
} 
	} 	
		public function getCalories ( ):int { 
	return currentCalories; 
			} 
	public function getHunger ( ):Number { 
	return currentCalories / VirtualPet.maxCalories; 
		} 
	private function die ( ):void { 
		stop( ); 
	setPetState(VirtualPet.PETSTATE_DEAD); 
		trace(getName( ) + " has died."); 
		} 

	private function digest ( ):void { 
	trace(getName( ) + " is digesting..."); 
	setCalories(getCalories( ) - VirtualPet.caloriesPerSecond); 
	}	 
	private function setPetState (newState:int):void { 
	if (newState == petState) { 
		return; 
	} 
	petState = newState;  
	dispatchEvent(new Event(VirtualPet.STATE_CHANGE)); 
	} 
	public function getPetState ( ):int { 
	return petState; 
	} 
	private function digestTimerListener (e:TimerEvent):void { 
		digest( ); 
		} 
	} 
} 
