package ParticleEmitters
{
	import Area.AreaImpl;
	import Area.Area;
	
	import org.flixel.FlxEmitter;
	import org.flixel.FlxPoint;
	import org.flixel.FlxG;
	import org.flixel.FlxParticle;
	
	public class AreaEmitter extends FlxEmitter
	{
		public var area:AreaImpl;
		
		public function AreaEmitter(X:Number=0, Y:Number=0, Size:Number=0, Area:AreaImpl=null)
		{
			super(X, Y, Size);
			area = Area;
		}
		
		override public function emitParticle():void
		{
			var particle:FlxParticle = recycle(FlxParticle) as FlxParticle;
			particle.lifespan = lifespan;
			particle.elasticity = bounce;
			particle.reset(x - (particle.width>>1) + FlxG.random()*width, y - (particle.height>>1) + FlxG.random()*height);
			particle.visible = true;
			
			if(minParticleSpeed.x != maxParticleSpeed.x)
				particle.velocity.x = minParticleSpeed.x + FlxG.random()*(maxParticleSpeed.x-minParticleSpeed.x);
			else
				particle.velocity.x = minParticleSpeed.x;
			if(minParticleSpeed.y != maxParticleSpeed.y)
				particle.velocity.y = minParticleSpeed.y + FlxG.random()*(maxParticleSpeed.y-minParticleSpeed.y);
			else
				particle.velocity.y = minParticleSpeed.y;
			particle.acceleration.y = gravity;
			
			if(minRotation != maxRotation)
				particle.angularVelocity = minRotation + FlxG.random()*(maxRotation-minRotation);
			else
				particle.angularVelocity = minRotation;
			if(particle.angularVelocity != 0)
				particle.angle = FlxG.random()*360-180;
			
			// position 
			var particlePoint:FlxPoint = this.area.randomPointInsideArea();
			particle.x = particlePoint.x;
			particle.y = particlePoint.y;
			
			particle.drag.x = particleDrag.x;
			particle.drag.y = particleDrag.y;
			particle.onEmit();
		}
		override public function update():void
		{
			super.update();
			area.x = this.x-64;
			area.y = this.y-364;
		}
	}
}