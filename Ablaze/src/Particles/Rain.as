package Particles
{
	import org.flintparticles.common.counters.Steady;
	import org.flintparticles.common.initializers.AlphaInit;
	import org.flintparticles.twoD.actions.Accelerate;
	import org.flintparticles.twoD.actions.CollisionZone;
	import org.flintparticles.twoD.actions.DeathZone;
	import org.flintparticles.twoD.actions.Move;
	import org.flintparticles.twoD.actions.SpeedLimit;
	import org.flintparticles.twoD.emitters.Emitter2D;
	import org.flintparticles.twoD.initializers.Position;
	import org.flintparticles.twoD.initializers.Velocity;
	import org.flintparticles.twoD.zones.DiscZone;
	import org.flintparticles.twoD.zones.LineZone;
	import org.flintparticles.twoD.zones.RectangleZone;
	
	import flash.geom.Point;
	
	public class Rain extends Emitter2D
	{
		public function Rain()
		{
			counter = new Steady( 1000 );
			
			addInitializer( new Position( new LineZone( new Point( -55, -5 ), new Point( 605, -5 ) ) ) );
			addInitializer( new Velocity( new DiscZone( new Point( 60, 400 ), 20 ) ) );
			addInitializer( new AlphaInit( 0.5 ) );
			
			addAction( new Move() );
//			addAction( new CollisionZone( new DiscZone( new Point( 245, 275 ), 150 ), 0.3 ) );
			addAction( new DeathZone( new RectangleZone( -60, -10, 610, 410 ), true ) );
			addAction( new Accelerate( 0, 500 ) );
			addAction( new SpeedLimit( 500 ) );
		}
	}
}