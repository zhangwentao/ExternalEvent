package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.external.ExternalInterface;
	import flash.system.Security;
	
	import me.wentao.external.ExternalEvent;
	import me.wentao.external.ExternalEventDispatcher;
	
	public class example extends Sprite
	{
		private var btn1:Button = new Button(0xFF0000,80,40);
		private var btn2:Button = new Button(0x00FF00,80,40);
		
		public function example()
		{
			Security.allowInsecureDomain("*");
			if(stage)
			{
				init();
			}
			else
			{
				this.addEventListener(Event.ADDED_TO_STAGE,init);
			}
		}
		
		private function init(evt:Event=null):void
		{
			ExternalEventDispatcher.getInstance().addExternalCall();
			
			btn1.addEventListener(MouseEvent.CLICK,handleBtn1Click);
			btn2.addEventListener(MouseEvent.CLICK,handleBtn2Click);
			btn2.y = 80;
			this.addChild(btn1);
			this.addChild(btn2);
			var info:Object = stage.loaderInfo.parameters;
			var readyDo:String = info["readyDo"];
			if (readyDo)
			{
				ExternalInterface.call(readyDo);
			}
		}
		
		private function handleBtn1Click(evt:MouseEvent):void
		{
			var event:ExternalEvent = new ExternalEvent("btn1click");
			event.addParam("msg","i am btn1");
			event.addParam("customParam",new Object());
			ExternalEventDispatcher.getInstance().dispatchEvent(event);
		}
		
		private function handleBtn2Click(evt:MouseEvent):void
		{
			var event:ExternalEvent = new ExternalEvent("btn2click");
			event.addParam("msg","i am btn2");
			event.addParam("customParam",{x:1,y:2});
			ExternalEventDispatcher.getInstance().dispatchEvent(event);
		}
	}
}