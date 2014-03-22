package ParticleEmitters
{
	import Particles.SmokeParticle;
	
	import org.flixel.FlxEmitter;
	
	public class SmokeEmitter extends FlxEmitter
	{
		
		public function SmokeEmitter(X:Number=0, Y:Number=0, Size:Number=0)
		{
			super(X, Y, Size);
			this.particleClass = SmokeParticle;
			setXSpeed(-5,5);
			setYSpeed(-20,-30);
			this.on = true;
			this.active = true;
			this.gravity = -20;
			this.start(false, 5, 0.1, 0);
		}
	}
}