package
{
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	
	public class Drape extends FlxSprite
	{
		[Embed(source="assets/art/drape.png")]
		public static var DrapeImg:Class;
		
		[Embed(source='assets/art/player.png')]
		public static var ImgPlayer:Class;
		
		public function Drape(X:Number=0, Y:Number=0, SimpleGraphic:Class=null)
		{
//			this.loadGraphic(DrapeImg, true,true, 2700, 2100);
			this.loadGraphic(ImgPlayer, true, true, 14, 15);
			this.scale.x /= 50;
			this.scale.y /= 50;
			this.x = X;
			this.y = Y;
		}
		override public function update():void
		{
			super.update();
//			trace("here i am")
		}
	}
}