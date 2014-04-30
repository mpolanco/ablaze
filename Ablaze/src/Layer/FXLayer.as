package Layer
{
	import org.flixel.FlxSprite;
	import flash.display.Sprite;
	import org.flixel.FlxG;
	
	public class FXLayer extends FlxSprite
	{
		private var _src:Sprite;
		
		public function FXLayer(XFSprite:Sprite) 
		{
			super();			
			_src = XFSprite;
			makeGraphic(1, 1, 0); //Or it will be a small white square :)
		}
		
		override public function draw():void
		{
			super.draw();
			_src.visible = true;	// But we make it visible only
			FlxG.camera.buffer.draw(_src);	// for the short moment
			_src.visible = false;	// of drawing it onto our FlxSprite
		}
	}
}