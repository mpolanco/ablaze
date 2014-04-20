
package {	
	import Area.PointArea;
	
	import ParticleEmitters.FireEmitter;
	import ParticleEmitters.FireSprite;
	import ParticleEmitters.SmokeEmitter;
	
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;
	import org.flixel.plugin.photonstorm.FlxControl;
	import org.flixel.plugin.photonstorm.FlxControlHandler;

	//TODO: implement as FlxGroup
	public class Player extends FlxSprite{
		//[Embed(source='../assets/art/player.png')]
		//public static var ImgPlayer:Class;

		public var smokeEmmitter:SmokeEmitter;
		public var fireEmitter:FireEmitter;
		public var fireSprite:FireSprite;
		
		//[Embed(source = '../assets/art/nutmeg.png')] private static var NutmegPNG:Class;
		
		public function Player(x:int, y:int) {
			super(x, y);
			this.setupGraphic();
			this.addAnimations();
			this.ignite();
			this.setupControl();
		}
		
		private function setupGraphic():void {
			//this.loadGraphic(NutmegPNG, true, true, 16, 18, true);
			this.alpha = 0;
			
			// collision box
			this.width = 12;
			this.height = 16;
			
			// image offset from collision box
			this.offset.x = 2;
			this.offset.y = 2;
		}
		
		private function addAnimations():void {
			//TODO: implement this
		}
		
		private function setupControl():void {
			//TODO: should we just use built-in flixel functionality??
			if (FlxG.getPlugin(FlxControl) == null)
			{
				FlxG.addPlugin(new FlxControl);
			}
			FlxControl.create(this, FlxControlHandler.MOVEMENT_ACCELERATES, FlxControlHandler.STOPPING_DECELERATES, 1, true, false); // sets up player1 attr of FlxControl
			FlxControl.player1.setCursorControl(false, false, true, true); // use only left & right arrow keys
			//TODO: should be KEYMODE_JUST_DOWN, but thats unresponsive... fix it!
			FlxControl.player1.setJumpButton("SPACE", FlxControlHandler.KEYMODE_PRESSED, 200, FlxObject.FLOOR);
			FlxControl.player1.setMovementSpeed(400, 0, 100, 200, 400, 0);
			FlxControl.player1.setGravity(0, 400);
			this.facing = FlxObject.RIGHT;
		}
		
		private function ignite():void {
			this.smokeEmmitter = new SmokeEmitter(this.x, this.y, 100);
			this.fireEmitter = new FireEmitter(new PointArea(this.x,this.y), this.x, this.y, 100);
		}
		
		override public function update():void {
			super.update();
			
			this.smokeEmmitter.x = this.x;
			this.smokeEmmitter.y = this.y+5;
			this.fireEmitter.x = this.x;
			this.fireEmitter.y = this.y;
			
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
