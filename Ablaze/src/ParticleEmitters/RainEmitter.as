package ParticleEmitters
{
	import Particles.Rain;
	
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	import flash.geom.Vector3D;
	
	import org.flintparticles.twoD.emitters.Emitter2D;
	import org.flintparticles.twoD.renderers.PixelRenderer;

	public class RainEmitter extends Sprite
	{
		private var rain:Rain;
		
		public function RainEmitter()
		{
			rain = new Rain();      
			rain.start( );
			
			var renderer:PixelRenderer = new PixelRenderer( new Rectangle( 0, 0, 600, 400 ) );
			renderer.addEmitter( rain );
			addChild( renderer );
			rain.start();
			rain.runAhead( 4, 30 );
		}
	}
}