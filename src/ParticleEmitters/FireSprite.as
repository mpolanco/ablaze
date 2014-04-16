package ParticleEmitters
{
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	import flash.geom.Vector3D;
	
	import org.flintparticles.threeD.emitters.Emitter3D;
	import org.flintparticles.threeD.renderers.BitmapRenderer;
	import org.flintparticles.threeD.renderers.controllers.OrbitCamera;
	import Particles.Fire;
	import Particles.Smoke;
	
	[SWF(width='400', height='400', frameRate='60', backgroundColor='#000000')]
	
	public class FireSprite extends Sprite
	{
		private var smoke:Emitter3D;
		private var fire:Emitter3D;
		private var orbitter:OrbitCamera;
		
		public function FireSprite(X:Number, Y:Number)
		{
//			this.x = X;
//			this.y = Y;
			smoke = new Smoke();      
			smoke.start( );
			
			fire = new Fire();
			fire.start( );
			
			var renderer:BitmapRenderer = new BitmapRenderer( new Rectangle( -200, -200, 400, 400 ) );
			renderer.x = 270;
			renderer.y = 55;
			renderer.addEmitter( smoke );
			renderer.addEmitter( fire );
			addChild( renderer );
			
			renderer.camera.position = new Vector3D( 0, -150, -400 );
			renderer.camera.target = new Vector3D( 0, -150, 0 );
			renderer.camera.projectionDistance = 400;
			orbitter = new OrbitCamera( stage, renderer.camera );
			orbitter.start();
		}
	}
}