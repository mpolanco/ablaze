package
{
	import org.flixel.*;
	import Levels.BaseLevel;

	public class PlayState extends FlxState
	{
		public var level:BaseLevel;
		protected var levelClass:Class;
		protected var player:Player;
		public static var state:PlayState;
		
		public function PlayState(levelClass:Class)
		{
			PlayState.state = this;
			super();
			this.levelClass = levelClass;
			trace(this.levelClass);
		}
		
		override public function create():void	
		{			
			this.level = new this.levelClass(true, onSpriteAdded);
			FlxG.camera.follow(this.player, FlxCamera.STYLE_PLATFORMER);
			FlxG.camera.setBounds(0, 0, this.level.mainLayer.width, this.level.mainLayer.height);
			FlxG.worldBounds = new FlxRect(0, 0, this.level.mainLayer.width, this.level.mainLayer.height);
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
	}
}