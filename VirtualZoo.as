package{ 
	import flash.display.Sprite;
	import zoo.*;
	import flash.events.*;
	
	public class VirtualZoo extends Sprite { 
		private var pet:VirtualPet; 
		private var petView:VirtualPetView;
		
		public function VirtualZoo ( ) { 
		try {
		pet = new VirtualPet("Msgfvuyg CfVgBhhh");
		trace("An error occurred: " +e.message);
		pet = new VirtualPet("Murka");
		}
		petView = new VirtualPetVie(pet);
		petView.addEventListener(Event.COMPLETE.petViewCompleteListener);
		}
		public function petVieCompleteListener(e:Event):void {
			addChild(petView);
			pet.start();
		pet.eat(new Sushi()); 
			} 
		} 
	} 