package ParticleEmitters
{
	import Particles.SmokeParticle;
	
	import org.flixel.FlxEmitter;
	import org.flixel.FlxG;
	import org.flixel.FlxParticle;
	
	public class SmokeEmitter extends FlxEmitter
	{
		private var timer:Number;
		private var size:Number;
		
		public function SmokeEmitter(X:Number=0, Y:Number=0, Size:Number=0)
		{
			super(X, Y, Size);
			this.size = Size;
			setXSpeed(-5,5);
			setYSpeed(-20,-30);
			this.gravity = -20;
//			this.lifespan = .1
			this.particleClass = SmokeParticle;
			for(var i:int = 0; i < Size; i++)
			{
				var particle:FlxParticle = new SmokeParticle();
				particle.exists = false;
				add(particle);
			}
			this.timer = 0;
			this.start(false, .1, 0.1, Size);
		}
//		override public function emitParticle():void {
//			super.emitParticle();
//			var particle:FlxParticle = new SmokeParticle();
//			particle.exists = false;
//			add(particle);
//			trace("hello")
//		}
		
		override public function update():void {
			super.update();
			this.timer += FlxG.elapsed;
			if (this.timer > 5 ){
				trace("resetting")
				this.timer = 0;
				for(var i:int = 0; i < this.size; i++)
				{
					var particle:FlxParticle = new SmokeParticle();
					particle.exists = false;
					add(particle);
				}
				this.start(false, 0.1, 0.1, this.size);	
			}
		}
	}
}