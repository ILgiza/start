package zoo {
  import flash.display.*
  import flash.events.*;
  import flash.text.*;

  public class FoodButton extends Sprite {
    private var text:TextField;
    private var upFormat:TextFormat;
    private var overFormat:TextFormat;

    public function FoodButton (label:String) {
      buttonMode = true;
      mouseChildren = false;
      
      upFormat = new TextFormat("_sans",12,0x006666,true);
      overFormat = new TextFormat("_sans",12,0x009999,true);
      
      text = new TextField();
      text.defaultTextFormat = upFormat;
      text.text = label;
      text.autoSize = TextFieldAutoSize.CENTER;
      text.selectable = false;
      addChild(text);

      addEventListener(MouseEvent.MOUSE_OVER, mouseOverListener);
      addEventListener(MouseEvent.MOUSE_OUT, mouseOutListener);
    }
    public function disable ():void {
      mouseEnabled = false;
    }

    public function mouseOverListener (e:MouseEvent):void {
      text.setTextFormat(overFormat);
    }

    public function mouseOutListener (e:MouseEvent):void {
      text.setTextFormat(upFormat);
    }
  }
}