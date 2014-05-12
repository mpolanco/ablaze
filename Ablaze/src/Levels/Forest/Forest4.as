package Levels.Forest
{
	import Levels.Forest4Level;
	
	import State.PlayState;
	
	import org.flixel.FlxPoint;
	
	public class Forest4 extends PlayState
	{
		public static const spawnLeft:FlxPoint = new FlxPoint(5, 200);
		public static const spawnRight:FlxPoint = new FlxPoint(620, 200);
		
		public function Forest4(spawn:FlxPoint=null)
		{
			super(Forest4Level, spawn);
		}
		
		override public function update():void {
			super.update();
			if (this.playerAtLeftEdge()) {
				this.hut.kill();
				this.fadeTransition(new Forest3(Forest3.spawnRight));
			} 
			else if (this.playerAtRightEdge()) {
				this.hut.kill();
				this.fadeTransition(new Forest5(Forest5.spawnLeft));
			}
		}
	}
}