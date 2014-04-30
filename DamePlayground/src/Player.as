package
{
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;
	import org.flixel.plugin.photonstorm.FlxControl;
	import org.flixel.plugin.photonstorm.FlxControlHandler;
	
	public class Player extends FlxSprite
	{
		[Embed(source = '../assets/art/player.png')] private static var playerPNG:Class;
		
		public function Player(level:PlaygroundLevel)
		{
			super(level.playerLocation().x, level.playerLocation().y);
			
			this.loadGraphic(playerPNG, true, true, 16, 18, true);
			this.setupGraphic();
			
			this.addAnimations();
			this.setupControl();
		}
		
		private function setupGraphic():void {
			// collision box
			this.width = 12;
			this.height = 16;
			
			// image offset from collision box
			this.offset.x = 2;
			this.offset.y = 2;
		}
		
		private function addAnimations():void {
			this.addAnimation("idle", [0], 0, false);
			this.addAnimation("walk", [0, 1, 0, 2], 10, true);
			this.addAnimation("jump", [1], 0, false);
			this.addAnimation("hurt", [4], 0, false);
		}
		
		private function setupControl():void {
			//TODO: should we just use built-in flixel functionality??
			if (FlxG.getPlugin(FlxControl) == null)
			{
				FlxG.addPlugin(new FlxControl);
			}
			FlxControl.create(this, FlxControlHandler.MOVEMENT_ACCELERATES, FlxControlHandler.STOPPING_DECELERATES, 1, true, false); // sets up player1 attr of FlxControl
			FlxControl.player1.setCursorControl(false, false, true, true); // use only left & right arrow keys
			FlxControl.player1.setJumpButton("SPACE", FlxControlHandler.KEYMODE_JUST_DOWN, 200, FlxObject.FLOOR);
			FlxControl.player1.setMovementSpeed(400, 0, 100, 200, 400, 0);
			FlxControl.player1.setGravity(0, 125);
			this.facing = FlxObject.RIGHT;
		}
		
		override public function update():void {
			super.update();
			if (x < 0)
			{
				x = 0;
			}
			//TODO: prevent player from exiting the level to the right
			
			if (touching == FlxObject.FLOOR)
			{
				if (velocity.x != 0)
				{
					play("walk");
				}
				else
				{
					play("idle");
				}
			}
			else if (velocity.y < 0)
			{
				play("jump");
			}
		}
	}
}