package State
{
	import Layer.FXLayer;
	
	import Levels.BaseLevel;
	
	import Objects.Hut;
	
	import ParticleEmitters.RainEmitter;
	
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	
	import org.flintparticles.twoD.renderers.PixelRenderer;
	import org.flixel.*;

	public class PlayState extends FlxState
	{
		public var level:BaseLevel;
		protected var levelClass:Class;
		public var player:Player;
		public static var state:PlayState;
		private var _flintFXrenderer:PixelRenderer;
		public static var rainEnabled:Boolean;
		
		public function PlayState(levelClass:Class)
		{
			PlayState.state = this;
			super();
			this.levelClass = levelClass;
		}
		
		override public function create():void	
		{			
			this.level = new this.levelClass(true, onSpriteAdded);
			FlxG.camera.follow(this.player, FlxCamera.STYLE_PLATFORMER);
			FlxG.camera.setBounds(0, 0, this.level.mainLayer.width, this.level.mainLayer.height);
			FlxG.worldBounds = new FlxRect(0, 0, this.level.mainLayer.width, this.level.mainLayer.height);
			_flintFXrenderer = new PixelRenderer( new Rectangle( 0, 0, 640, 480 ) );
			var hut:Hut = new Hut(250, 150);
			add(hut);
			add(hut.fireEmitter);
		}
		
		override public function update():void
		{
			super.update();
			FlxG.collide(this.player, this.level.mainLayer);
		}
		
		private function startRain():void {
			var fx:Sprite = new RainEmitter();	
			FlxG.stage.addChild(fx);	//We have to add it or Flash won't render it at all
			fx.addChild( _flintFXrenderer );	
			
			var rainLayer:FXLayer = new FXLayer(fx);
			this.add(rainLayer);
		}
		
		public function onSpriteAdded(sprite:FlxSprite, group:FlxGroup):void
		{
			if (sprite is Player) {
				this.player = sprite as Player;
				this.player.addGraphics(group);
			}
		}
	}
}