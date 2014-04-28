package ParticleEmitters
{
	import Area.AreaImpl;
	
	import Particles.FireParticle;
	
	import org.flixel.FlxG;
	import org.flixel.FlxParticle;
	
	public class FireEmitter extends AreaEmitter
	{
		private var timer:Number;
		private var size:Number;
		
		public function FireEmitter(Area:AreaImpl, X:Number=0, Y:Number=0, Size:Number=0, Frequency:Number=0.05)
		{
			trace("Constructing fire emitter");
			super(X, Y, Size, Area);
			this.size = Size;
			setXSpeed(-25,15);
			setYSpeed(-10,-20);
			this.gravity = -40;
			this.particleClass = FireParticle;
			this.frequency = Frequency;
			for(var i:int = 0; i < Size; i++)
			{
				var particle:FlxParticle = new FireParticle();
				particle.exists = false;
				add(particle);
			}
			this.timer = 0;
			this.start(false, .1, this.frequency, Size);
		}
		
		
		override public function update():void {
			super.update();
			this.timer += FlxG.elapsed;
			if (this.timer > 1 ){
				this.timer = 0;
				for(var i:int = 0; i < this.size; i++)
				{
					var particle:FlxParticle = new FireParticle();
					particle.exists = false;
					add(particle);
				}
				this.start(false, 0.1, this.frequency, this.size);	
			}
		}
	}
}