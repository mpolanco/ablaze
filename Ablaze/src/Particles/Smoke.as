package Particles
{
	import org.flintparticles.common.actions.Age;
	import org.flintparticles.common.actions.Fade;
	import org.flintparticles.common.actions.ScaleImage;
	import org.flintparticles.common.counters.Steady;
	import org.flintparticles.common.displayObjects.RadialDot;
	import org.flintparticles.common.initializers.Lifetime;
	import org.flintparticles.common.initializers.SharedImage;
	import org.flintparticles.threeD.actions.LinearDrag;
	import org.flintparticles.threeD.actions.Move;
	import org.flintparticles.threeD.actions.RandomDrift;
	import org.flintparticles.threeD.emitters.Emitter3D;
	import org.flintparticles.threeD.initializers.Velocity;
	import org.flintparticles.threeD.zones.ConeZone;
	import org.flintparticles.threeD.actions.Accelerate;
	
	import flash.geom.Vector3D;
	import org.flixel.FlxG;
	
	public class Smoke extends Emitter3D
	{
		var leftForce:Accelerate = new Accelerate( new Vector3D( 40, 0, 0 ) );
		var rightForce:Accelerate = new Accelerate( new Vector3D( -40, 0, 0 ) );
		var left:Boolean = false;
		var right:Boolean = false;
		
		public function Smoke()
		{
			counter = new Steady( 10 );
			
			addInitializer( new Lifetime( 11, 12 ) );
			addInitializer( new Velocity( new ConeZone( new Vector3D( 0, 0, 0 ), new Vector3D( 0, -1, 0 ), 0.5, 40, 30 ) ) );
			addInitializer( new SharedImage( new RadialDot( 6 ) ) );
			
			addAction( new Age( ) );
			addAction( new Move( ) );
			addAction( new LinearDrag( 0.01 ) );
			addAction( new ScaleImage( 1, 15 ) );
			addAction( new Fade( 0.15, 0 ) );
			addAction( new RandomDrift( 15, 15, 15 ) );
		}
		override public function update(time:Number):void
		{
			if (FlxG.keys.LEFT && !left) 
			{
				trace("LEft pressed");
				left = true;
				addAction( leftForce );
			}
			else if (FlxG.keys.RIGHT && !right)
			{
				trace("Right pressed");
				right = true;
				addAction( rightForce );
			}
			
			if (!FlxG.keys.LEFT && left) 
			{
				trace("LEft released");
				left = false;
				removeAction( leftForce );
			}
			else if (!FlxG.keys.RIGHT && right)
			{
				trace("Right released");
				right = false;
				removeAction( rightForce );
			}
			super.update(time);
		}
	}
}