package zoo { 
	import flash.display.*; 
	import flash.events.*; 
	import flash.net.*;
	import flash.text.*; 
   public class VirtualPetView extends Sprite { 
   private var pet:VirtualPet;
    
	private var graphicsContainer:Sprite;
	
	 private var petAlive:Loader;     
    private var petDead:Loader;      
    private var foodHungry:Loader;    
    private var foodStarving:Loader;  
	private var petName:TextField;    
  
	
    private var appleBtn:FoodButton;  
    private var sushiBtn:FoodButton;  

    static private var numGraphicsToLoad:int = 4; 
                                                 
    private var numGraphicsLoaded:int = 0;  
                                           

    public function VirtualPetView (pet:VirtualPet) {
      this.pet = pet;
     
      pet.addEventListener(VirtualPet.NAME_CHANGE, 
                           petNameChangeListener);
      pet.addEventListener(VirtualPet.STATE_CHANGE, 
                           petStateChangeListener);
      
      createGraphicsContainer();
      createNameTag();
      createUI();
      loadGraphics();
    }

   
    private function createGraphicsContainer ():void {
      graphicsContainer = new Sprite();
      addChild(graphicsContainer);
    }

  
    private function createNameTag ():void {
      petName = new TextField();
      petName.defaultTextFormat = new TextFormat("_sans",14,0x006666,true);
      petName.autoSize = TextFieldAutoSize.CENTER;
      petName.selectable = false;
      petName.x = 250;
      petName.y = 20;
      addChild(petName);
    }

    private function createUI ():void {
      appleBtn = new FoodButton("Feed Apple");
      appleBtn.y = 170;
      appleBtn.addEventListener(MouseEvent.CLICK, appleBtnClick);
      addChild(appleBtn);

      sushiBtn = new FoodButton("Feed Sushi");
      sushiBtn.y = 190;
      sushiBtn.addEventListener(MouseEvent.CLICK, sushiBtnClick);
      addChild(sushiBtn);      
    }

    private function disableUI ():void {
      appleBtn.disable();
      sushiBtn.disable();
    }

    private function loadGraphics ():void {
      petAlive = new Loader();
      petAlive.load(new URLRequest("pet-alive.gif"));
      petAlive.contentLoaderInfo.addEventListener(Event.COMPLETE,
                                           completeListener);
      petAlive.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,
                                           ioErrorListener);

      petDead = new Loader();
      petDead.load(new URLRequest("pet-dead.gif"));
      petDead.contentLoaderInfo.addEventListener(Event.COMPLETE,
                                          completeListener);
      petDead.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,
                                          ioErrorListener);

      foodHungry = new Loader();
      foodHungry.load(new URLRequest("food-hungry.gif"));
      foodHungry.contentLoaderInfo.addEventListener(Event.COMPLETE,
                                             completeListener);
      foodHungry.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,
                                             ioErrorListener);
      foodHungry.x = 15;
      foodHungry.y = 100;

      foodStarving = new Loader();
      foodStarving.load(new URLRequest("food-starving.gif"));
      foodStarving.contentLoaderInfo.addEventListener(Event.COMPLETE,
                                               completeListener);
      foodStarving.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,
                                               ioErrorListener);
      foodStarving.x = 15;
      foodStarving.y = 100;
    }

    private function petStateChangeListener (e:Event):void {
      if (pet.getPetState() == VirtualPet.PETSTATE_DEAD) {
        disableUI();
      }
      renderCurrentPetState();
    }
    private function renderCurrentPetState ():void {
      for (var i:int = graphicsContainer.numChildren-1; i >= 0; i--) {
        graphicsContainer.removeChildAt(i);
	  }
      var state:int = pet.getPetState();  
      
      
      switch (state) {
        case VirtualPet.PETSTATE_FULL:
          graphicsContainer.addChild(petAlive);
          break;

        case VirtualPet.PETSTATE_HUNGRY:
          graphicsContainer.addChild(petAlive);
          graphicsContainer.addChild(foodHungry);
          break;
        
        case VirtualPet.PETSTATE_STARVING:
          graphicsContainer.addChild(petAlive);
          graphicsContainer.addChild(foodStarving);
          break;

        case VirtualPet.PETSTATE_DEAD:
          graphicsContainer.addChild(petDead);
          break;
      }
    }

   
    private function petNameChangeListener (e:Event):void {
      renderCurrentPetName();
    }

    
    private function renderCurrentPetName ():void {
      petName.text = pet.getName();
    }
    private function appleBtnClick (e:MouseEvent):void {
      pet.eat(new Apple());
    }

    
    private function sushiBtnClick (e:MouseEvent):void {
      pet.eat(new Sushi());
    }
	
    private function completeListener (e:Event):void {
      numGraphicsLoaded++;
      if (numGraphicsLoaded == numGraphicsToLoad) {
        renderCurrentPetState();
        renderCurrentPetName();
        dispatchEvent(new Event(Event.COMPLETE));
      }
    }
    
    private function ioErrorListener (e:IOErrorEvent):void {
      trace("Load error: " + e);
    }
  }
}
