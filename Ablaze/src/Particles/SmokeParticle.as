package Particles
{
	import org.flixel.FlxG;
	import org.flixel.FlxParticle;
	
	public class SmokeParticle extends FlxParticle
	{
		[Embed(source='../../assets/art/RadialDot.png')]
		public static var SmokeImg:Class;
		private var duration:Number = 60*6;
		private var timer:Number;
		
		public function SmokeParticle()
		{
			super();
			this.loadGraphic(SmokeImg, false, false, 128, 128, false);
			this.scale.x /= 4;
			this.scale.y /= 4;
			this.alpha = .5;
			this.timer = 0;
		}
		override public function update():void
		{
			super.update();
			this.timer += FlxG.elapsed;
			if (this.timer > .1) {
				this.alpha -= 1.0/duration;
				if (this.alpha <= 0) {
					super.kill();
				}
			}
		}
		override public function kill():void
		{
			this.alive = false;		
		}
		override public function revive():void 
		{
			super.revive();
			this.alpha = .5;
			this.timer = 0;
		}
		override public function reset(X:Number, Y:Number):void 
		{
			super.reset(X, Y);
			this.alpha = .5;
			this.timer = 0;
		}
	}
}