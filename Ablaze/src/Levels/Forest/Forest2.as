package Levels.Forest
{
	import Levels.Forest2Level;
	
	import org.flixel.FlxPoint;
	
	public class Forest2 extends PlayState
	{
		public static const spawnLeft:FlxPoint = new FlxPoint(5, 200);
		public static const spawnRight:FlxPoint = new FlxPoint(450, 200);
		
		public function Forest2(spawn:FlxPoint)
		{
			super(Forest2Level, spawn);
		}
		
		override public function update():void {
			super.update();
			if (this.exitLeft()) {
				this.fadeTransition(new Forest1(Forest1.spawnRight));
			}else if (this.exitRight()) {
				this.fadeTransition(new Forest3(Forest3.spawnLeft));
			}
		}
		
		private function exitLeft():Boolean {
			return this.player.x <= 1;
		}
		
		private function exitRight():Boolean {
			return this.player.x >= 460;
		}
	}
}