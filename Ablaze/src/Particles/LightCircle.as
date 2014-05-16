package Particles
{
	import State.PlayState;
	
	import flash.display.Graphics;
	
	import org.flixel.FlxG;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	
	public class LightCircle extends FlxSprite
	{
		[Embed(source="../../assets/art/RadialDot.png")]
		private var LightImageClass:Class;
		
		private var darkness:FlxSprite;
		public var baseRadius:Number;
		public var flickerRadius:Number;
		public var flickerScale:FlxPoint;
		
		public function LightCircle(X:Number=0, Y:Number=0, Radius:Number=0)
		{
			super(X, Y);
			this.loadGraphic(LightImageClass, false, false, 128, 128, false);
			
			this.baseRadius = Radius;
			this.scale.x = this.baseRadius / (128);
			this.scale.y = this.baseRadius / (128);
			this.blend = "screen";
			this.color = 0xFFE4B5;
			this.alpha = 1;
		}
		override public function update():void {
			flickerRadius = this.baseRadius + FlxG.random() * 10;
			this.scale.x = this.flickerRadius / (128);
			this.scale.y = this.flickerRadius / (128);
		}
		
		override public function draw():void {
			if (PlayState.state.darkness != null && PlayState.state.player != null) {
				var screenXY:FlxPoint = PlayState.state.player.getScreenXY();
				PlayState.state.darkness.stamp(this, screenXY.x-this.flickerRadius/this.scale.x/2, screenXY.y-this.baseRadius/this.scale.y/2);
			}
		}
		
		/**
		 * This function draws a circle on this sprite at position X,Y
		 * with the specified color.
		 * @param   X           X coordinate of the circle's center
		 * @param   Y           Y coordinate of the circle's center
		 * @param   Radius      Radius of the circle
		 * @param   Color       Color of the circle
		 */
		public function drawCircle(X:Number, Y:Number, Radius:Number, Color:Number):void
		{
			var gfx:Graphics = FlxG.flashGfx;
			gfx.clear();
			gfx.beginFill(Color, 1);
			gfx.drawCircle(X, Y, Radius);
			gfx.endFill();
			
			_pixels.draw(FlxG.flashGfxSprite);
			dirty = true;
		}
	}
}