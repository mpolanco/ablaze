package
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	
	import org.flintparticles.common.actions.Age;
	import org.flintparticles.common.actions.ColorChange;
	import org.flintparticles.common.actions.ScaleImage;
	import org.flintparticles.common.counters.Steady;
	import org.flintparticles.common.displayObjects.RadialDot;
	import org.flintparticles.common.easing.TwoWay;
	import org.flintparticles.common.initializers.ImageClass;
	import org.flintparticles.common.initializers.Lifetime;
	import org.flintparticles.twoD.actions.Accelerate;
	import org.flintparticles.twoD.actions.LinearDrag;
	import org.flintparticles.twoD.actions.Move;
	import org.flintparticles.twoD.actions.RotateToDirection;
	import org.flintparticles.twoD.emitters.Emitter2D;
	import org.flintparticles.twoD.initializers.Position;
	import org.flintparticles.twoD.initializers.Velocity;
	import org.flintparticles.twoD.zones.BitmapDataZone;
	import org.flintparticles.twoD.zones.DiscSectorZone;
	import org.flixel.FlxEmitter;
	
	public class LogoFire extends Emitter2D
	{
		public function LogoFire()
		{
			counter = new Steady( 600 );
			
			addInitializer( new Lifetime( 0.8 ) );
			addInitializer( new Velocity( new DiscSectorZone( new Point( 0, 0 ), 10, 5, -Math.PI * 0.75, -Math.PI * 0.25 ) ) );
			var bitmap:BitmapData = new BitmapData( 265, 80 );
			addInitializer( new Position( new BitmapDataZone( bitmap ) ) );
			addInitializer( new ImageClass( RadialDot, [2] ) );
			
			addAction( new Age( TwoWay.quadratic ) );
			addAction( new Move() );
			addAction( new LinearDrag( 1 ) );
			addAction( new Accelerate( 0, -20 ) );
			addAction( new ColorChange( 0xFFFF9900, 0x00FFDD66 ) );
			addAction( new ScaleImage( 1.4, 2 ) );
			addAction( new RotateToDirection() );
		}
	}
}