package
{
	import Levels.BasicLevel;
	import Levels.NutmegLevel;
	
	import org.flixel.FlxCamera;
	import org.flixel.FlxG;
	import org.flixel.FlxRect;
	import org.flixel.FlxState;
	import Levels.TestLevel;
	
	public class Playground extends FlxState
	{
		protected var player:Player;
		protected var level:PlaygroundLevel;
				
		public function Playground()
		{
			super();
		}
		
		override public function create():void {
			this.level = new TestLevel();
			this.add(level);
			this.player = new Player(level);
			this.add(player);
			
			FlxG.worldBounds = new FlxRect(0, 0, this.level.width(), this.level.height());
			FlxG.camera.setBounds(0, 0, this.level.width(), this.level.height());
			FlxG.camera.follow(player, FlxCamera.STYLE_PLATFORMER);
		}
		
		override public function update():void
		{
			super.update();
			FlxG.collide(player, level);
		}
	}
}
