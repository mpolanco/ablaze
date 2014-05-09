package Levels.Forest
{
	import Levels.Forest3Level;
	
	import State.PlayState;
	
	import org.flixel.FlxPoint;
	
	public class Forest3 extends PlayState
	{
		public static const spawnLeft:FlxPoint = new FlxPoint(5, 200);
		public static const spawnRight:FlxPoint = new FlxPoint(620, 200);
		
		public function Forest3(spawn:FlxPoint)
		{
			super(Forest3Level, spawn);
		}
		
		override public function update():void {
			super.update();
			if (this.playerAtLeftEdge()) {
				this.fadeTransition(new Forest2(Forest2.spawnRight));
			}else if (this.playerAtRightEdge()) {
				this.fadeTransition(new Forest4(Forest4.spawnLeft));
			}
			
		}
		
//		private function exitLeft():Boolean {
//			return this.player.x <= 1;
//		}
	}
}