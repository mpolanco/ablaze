package
{
	import Levels.BaseLevel;
	
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;

	public class PlayState extends FlxState
	{
		public var level:BaseLevel;
		protected var levelClass:Class;
		public var player:Player;
		public static var state:PlayState;
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
			super.create();
			this.level = new this.levelClass(true, onSpriteAdded);
			FlxG.camera.follow(this.player, FlxCamera.STYLE_PLATFORMER);
			FlxG.camera.setBounds(0, 0, this.level.mainLayer.width, this.level.mainLayer.height);
			FlxG.worldBounds = new FlxRect(0, 0, this.level.mainLayer.width, this.level.mainLayer.height);
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
		
		public function onSpriteAdded(sprite:FlxSprite, group:FlxGroup):void
		{
			if (sprite is Player) {
				this.player = sprite as Player;
				this.player.addGraphics(group);
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
			function onFadeComplete():void {
				FlxG.switchState(levelState);
			}
			FlxG.fade(0xaa000000, 1, onFadeComplete);
		}
	}
}