package State
{
	import Layer.FXLayer;
	
	import Levels.BaseLevel;
	
	import Objects.Hut;
	
	import ParticleEmitters.RainEmitter;
	
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	import flash.sampler.startSampling;
	
	import org.flintparticles.twoD.renderers.PixelRenderer;
	import org.flixel.FlxCamera;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxPoint;
	import org.flixel.FlxRect;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.plugin.photonstorm.FlxControl;

	public class PlayState extends FlxState
	{
		public var level:BaseLevel;
		protected var levelClass:Class;
		public var player:Player;
		public static var state:PlayState;
		private var _flintFXrenderer:PixelRenderer;
		public static var rainEnabled:Boolean;
		protected var spawn:FlxPoint;
		public var transitioning:Boolean;
		protected static var _Raining:Boolean = false;
		public var darkness:FlxSprite;
		
		public function PlayState(levelClass:Class, spawn:FlxPoint=null)
		{
			PlayState.state = this;
			super();
			this.levelClass = levelClass;
			this.spawn = spawn;
			this.transitioning = true;
		}
		
		override public function create():void	
		{			
			PlayState.state = this;
			super.create();
			darkness = new FlxSprite(0,0);
			this.level = new this.levelClass(true, onSpriteAdded);
			FlxG.camera.setBounds(0, 0, this.level.mainLayer.width, this.level.mainLayer.height);
			FlxG.camera.zoom = 2;
			FlxG.camera.follow(this.player, FlxCamera.STYLE_PLATFORMER);
			FlxG.worldBounds = new FlxRect(0, 0, this.level.mainLayer.width, this.level.mainLayer.height);
			_flintFXrenderer = new PixelRenderer( new Rectangle( 0, 0, 640, 480 ) );
			if (PlayState.Raining) {
				this.startRain();
			}

//			var hut:Hut = new Hut(250, 150);
//			this.level.masterLayer.add(hut);
//			this.level.masterLayer.add(hut.fireEmitter);
			
			if (this.spawn) {
				this.player.x = this.spawn.x;
				this.player.y = this.spawn.y;
			}
			this.fadeIn();
		}
		
		override public function update():void
		{
			super.update();
			FlxG.collide(this.player, this.level.mainLayer);
		}
		
		protected function startRain():void {
			var fx:Sprite = new RainEmitter();	
			FlxG.stage.addChild(fx);	//We have to add it or Flash won't render it at all
			fx.addChild( _flintFXrenderer );	
			this.setDarkness(.5);
			
			var rainLayer:FXLayer = new FXLayer(fx);
			this.level.masterLayer.add(rainLayer);
		}
		
		public function onSpriteAdded(sprite:FlxSprite, group:FlxGroup):void
		{
			if (sprite is Player) {
				//trace("Playstate: "+this+"Player FOUND");
				this.player = sprite as Player;
				this.player.addGraphics(group);
			}else if (sprite is Hut) {
				var hut:Hut = sprite as Hut;
				group.add(hut.fireEmitter);
			}
		}
		
		private function fadeIn():void {
			function onFadeComplete():void {
				FlxControl.player1.enabled = true;
			}
			FlxG.flash(0xff111111, 2, onFadeComplete);
		}
		
		protected function fadeTransition(levelState:PlayState):void {
			FlxControl.player1.enabled = false;
			//FlxControl.player1.setGravity(0,0);
			this.player.velocity.y = 0;
			function onFadeComplete():void {
				FlxG.switchState(levelState);
			}
			FlxG.fade(0xaa000000, 1, onFadeComplete);
		}
		
		protected function playerAtLeftEdge():Boolean {
			return this.player.x <= 0;
		}
		
		protected function playerAtRightEdge():Boolean {
			return this.player.x + this.player.width >= this.level.mainLayer.width;
		}

		public static function get Raining():Boolean
		{
			return protected::_Raining;
		}

		public static function set Raining(value:Boolean):void
		{
			if (!_Raining && value) {
				PlayState.state.startRain();
			}
			protected::_Raining = value;
		}
		
		/*
		 * @Params alpha - intensity of the darkness in the scene from 0-1
		 */
		public function setDarkness(alpha:Number) {
			darkness = new FlxSprite(0,0);
			darkness.makeGraphic(FlxG.width, FlxG.height, 0xff000000);
			darkness.alpha = alpha;
			darkness.scrollFactor.x = darkness.scrollFactor.y = 0;
			darkness.blend = "multiply";
			
			add(darkness);
		}
		
		override public function draw():void {
			darkness.fill(0xff000000);
			super.draw();
		}
	}
}