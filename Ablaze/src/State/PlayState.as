package State
{
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	
	import Layer.FXLayer;
	
	import Levels.BaseLevel;
	
	import Objects.Hut;
	
	import ParticleEmitters.RainEmitter;
	
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
			this.level = new this.levelClass(true, onSpriteAdded);
			FlxG.camera.setBounds(0, 0, this.level.mainLayer.width, this.level.mainLayer.height);
			FlxG.camera.zoom = 2;
			FlxG.camera.follow(this.player, FlxCamera.STYLE_PLATFORMER);
			FlxG.worldBounds = new FlxRect(0, 0, this.level.mainLayer.width, this.level.mainLayer.height);
			_flintFXrenderer = new PixelRenderer( new Rectangle( 0, 0, 640, 480 ) );

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
	}
}