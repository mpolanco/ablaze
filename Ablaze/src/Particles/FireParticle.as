package Particles
{
	import org.flintparticles.common.utils.interpolateColors;
	import org.flixel.FlxG;
	import org.flixel.FlxParticle;
	import org.flixel.FlxPoint;
	
	public class FireParticle extends FlxParticle
	{
		[Embed(source='../../assets/art/RadialDot.png')]
		public static var FireImg:Class;
		private static const duration:Number = 60*3;
		private var timer:Number
		private static const _startColor:uint = 0xFFFFCC00;
		private static const _endColor:uint = 0x00CC0000;
		private static const _startScale:Number = 1/4;
		private static const _endScale:Number = 1/8;
		private var _energy:Number = 1;
		
		public function FireParticle()
		{
			super();
			this.loadGraphic(FireImg, false, false, 128, 128, false);
			//this.makeGraphic(64, 64,0xffffffff, false);
			this.scale.x = _startScale;
			this.scale.y = _startScale;
			this.alpha = .5;
			this.timer = 0;
			this.color = _startColor;
			this.scale = new FlxPoint(_startScale,_startScale);
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
			_energy -= 1/(duration-60*1.5);
			scale.x -= 1/((1/_endScale)*(duration-60*1.5));
			scale.y -= 1/((1/_endScale)*(duration-60*1.5));
//			if (_energy < 0) {
//				_energy = 0;
//			}
			
			this.color = interpolateColors(_startColor, _endColor, _energy);
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
			this.color = _startColor;
			this._energy = 1;
			this.scale = new FlxPoint(_startScale,_startScale);
		}
		override public function reset(X:Number, Y:Number):void 
		{
			super.reset(X, Y);
			this.alpha = .5;
			this.timer = 0;
			this.color = _startColor;
			this._energy = 1;
			this.scale = new FlxPoint(_startScale,_startScale);
		}
	}
}