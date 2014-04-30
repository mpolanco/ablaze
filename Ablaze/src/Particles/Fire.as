package Particles
{
	import flash.geom.Vector3D;
	
	import org.flintparticles.common.actions.Age;
	import org.flintparticles.common.actions.ColorChange;
	import org.flintparticles.common.actions.ScaleImage;
	import org.flintparticles.common.counters.Steady;
	import org.flintparticles.common.displayObjects.RadialDot;
	import org.flintparticles.common.initializers.Lifetime;
	import org.flintparticles.common.initializers.SharedImage;
	import org.flintparticles.threeD.actions.Accelerate;
	import org.flintparticles.threeD.actions.LinearDrag;
	import org.flintparticles.threeD.actions.Move;
	import org.flintparticles.threeD.actions.RotateToDirection;
	import org.flintparticles.threeD.emitters.Emitter3D;
	import org.flintparticles.threeD.initializers.Position;
	import org.flintparticles.threeD.initializers.Velocity;
	import org.flintparticles.threeD.zones.DiscZone;
	import org.flixel.FlxG;
	
	public class Fire extends Emitter3D
	{
		private var leftForce:Accelerate = new Accelerate( new Vector3D( 40, 0, 0 ) );
		private var rightForce:Accelerate = new Accelerate( new Vector3D( -40, 0, 0 ) );
		private var left:Boolean = false;
		private var right:Boolean = false;
		
		
		public function Fire()
		{
			counter = new Steady( 30 );
			
			addInitializer( new Lifetime( 2, 3 ) );
			addInitializer( new Velocity( new DiscZone( new Vector3D( 0, 0, 0 ), new Vector3D( 0, 1, 0 ), 20 ) ) );
			addInitializer( new Position( new DiscZone( new Vector3D( 0, 0, 0 ), new Vector3D( 0, 1, 0 ), 3 ) ) );
			addInitializer( new SharedImage( new RadialDot( 6 ) ) );
//			addInitializer( new SharedImage( new FireBlob() ) );
			
			addAction( new Age( ) );
			addAction( new Move( ) );
			addAction( new LinearDrag( 1 ) );
			addAction( new Accelerate( new Vector3D( 0, -40, 0 ) ) );
			addAction( new ColorChange( 0xFFFFCC00, 0x00CC0000 ) );
			addAction( new ScaleImage( 1, 1.5 ) );
			addAction( new RotateToDirection() );
		}
		override public function update(time:Number):void
		{
			if (FlxG.keys.LEFT && !left) 
			{
				left = true;
				addAction( leftForce );
			}
			else if (FlxG.keys.RIGHT && !right)
			{
				right = true;
				addAction( rightForce );
			}
			
			if (!FlxG.keys.LEFT && left) 
			{
				left = false;
				removeAction( leftForce );
			}
			else if (!FlxG.keys.RIGHT && right)
			{
				right = false;
				removeAction( rightForce );
			}
			super.update(time);
		}
	}
}