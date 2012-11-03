package
{
	import flash.display.Sprite;
	
	public class Button extends Sprite
	{
		public function Button(color:uint,width:int,height:int)
		{
			this.graphics.beginFill(color);
			this.graphics.drawRect(0,0,width,height);
			this.graphics.endFill();
			this.buttonMode = true;
		}
	}
}