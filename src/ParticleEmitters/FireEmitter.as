package ParticleEmitters
{
	import Particles.FireParticle;
	
	import org.flixel.FlxEmitter;
	import org.flixel.FlxG;
	import org.flixel.FlxParticle;
	
	public class FireEmitter extends FlxEmitter
	{
		private var timer:Number;
		private var size:Number;
		
		public function FireEmitter(X:Number=0, Y:Number=0, Size:Number=0)
		{
			super(X, Y, Size);
			this.size = Size;
			setXSpeed(-25,15);
			setYSpeed(-10,-20);
			this.gravity = -40;
			this.particleClass = FireParticle;
			for(var i:int = 0; i < Size; i++)
			{
				var particle:FlxParticle = new FireParticle();
				particle.exists = false;
				add(particle);
			}
			this.timer = 0;
			this.start(false, .1, 0.05, Size);
		}
		
		override public function update():void {
			super.update();
			this.timer += FlxG.elapsed;
			if (this.timer > 3 ){
				trace("resetting")
				this.timer = 0;
				for(var i:int = 0; i < this.size; i++)
				{
					var particle:FlxParticle = new FireParticle();
					particle.exists = false;
					add(particle);
				}
				this.start(false, 0.1, 0.05, this.size);	
			}
		}
	}
}