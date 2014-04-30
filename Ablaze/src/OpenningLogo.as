package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	
	import org.flintparticles.twoD.emitters.Emitter2D;
	import org.flintparticles.twoD.renderers.BitmapRenderer;
	import org.flixel.FlxSprite;
	
	//[SWF(width='500', height='200', frameRate='60', backgroundColor='#000000')]
	
	public class OpenningLogo extends Sprite
	{
		public var emitter:Emitter2D;
		
		public function OpenningLogo()
		{
			var bitmap:Bitmap = new Bitmap( new BitmapData( 1080, 200 ) );
			addChild( bitmap );
			bitmap.x = 118;
			bitmap.y = 70;
			
			emitter = new LogoFire();
			
			var renderer:BitmapRenderer = new BitmapRenderer( new Rectangle( 0, 0, 1080, 200 ) );
			renderer.addEmitter( emitter );
			addChild( renderer );
			
			emitter.x = 118;
			emitter.y = 70;
			emitter.start( );
		}
	}
}