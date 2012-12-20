package zoo { 
	import flash.display.Sprite;
	
	public class VirtualZoo extends Sprite { 
		private var pet; 
		
		public function VirtualZoo ( ) { 
		pet = new VirtualPet("Murka");
		pet.eat(new Apple());
		pet.eat(new Sushi()); 
			} 
		} 
	} 