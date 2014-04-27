package Stage
{		
	import Area.RectangleArea;
	
	import Layer.FXLayer;
	
	import ParticleEmitters.RainEmitter;
	
	import Text.AblazeText;
	
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	
	import org.flintparticles.twoD.renderers.PixelRenderer;
	import org.flixel.FlxCamera;
	import org.flixel.FlxG;
	import org.flixel.FlxRect;
	import org.flixel.FlxState;
	
	public class AblazeStage extends FlxState
	{
		public static var stage:AblazeStage;
		
		private var _flintFXrenderer:PixelRenderer;
		public var player:Player;
		protected var scene:AblazeScene;
		public var drape:Drape;
		
		public function AblazeStage(scene:AblazeScene)
		{
			super();
			this.scene = scene;
			stage = this;
		}
		
		override public function create():void {
			this.add(this.scene);
			this.player = new Player(this.scene.startLocation().x, this.scene.startLocation().y);
			this.drape = new Drape(this.scene.startLocation().x+20, this.scene.startLocation().y);
			var testText:AblazeText = new AblazeText(this.scene.startLocation().x-20, this.scene.startLocation().y+120, 100, 
							new RectangleArea(this.scene.startLocation().x-20, this.scene.startLocation().y+120, 100, 100, true), "Test");
			
			//TODO: once player is implemented as FlxGroup, adding player should add all its elements
			this.add(this.player.smokeEmmitter);
			this.add(this.player.fireEmitter);
			this.add(this.player);
			
			this.add(this.drape);
			this.add(this.drape.fireEmitter);
			
			this.add(testText);
			
			_flintFXrenderer = new PixelRenderer( new Rectangle( 0, 0, 640, 480 ) );
			var fx:Sprite = new RainEmitter();		
			FlxG.stage.addChild(fx);	//We have to add it or Flash won't render it at all
			fx.addChild( _flintFXrenderer );	
			
			var rainLayer:FXLayer = new FXLayer(fx);
			this.add(rainLayer);
			
			FlxG.worldBounds = new FlxRect(0, 0, this.scene.width(), this.scene.height());
			FlxG.camera.setBounds(0, 0, this.scene.width(), this.scene.height());
			FlxG.camera.follow(player, FlxCamera.STYLE_PLATFORMER);
		}
		
		override public function update():void
		{
			super.update();
			FlxG.collide(player, scene);
		}
	}
}