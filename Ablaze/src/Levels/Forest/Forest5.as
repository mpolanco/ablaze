package Levels.Forest
{
	import Levels.Forest5Level;
	
	import State.PlayState;
	
	import org.flixel.FlxPoint;
	
	public class Forest5 extends PlayState
	{
		public static const spawnLeft:FlxPoint = new FlxPoint(5, 200);
		public static const spawnRight:FlxPoint = new FlxPoint(620, 200);
		
		public function Forest5(spawn:FlxPoint=null)
		{
			super(Forest5Level, spawn);
		}
		override public function update():void {
			super.update();
			if (this.playerAtLeftEdge()) {
				this.fadeTransition(new Forest4(Forest4.spawnRight));
			} 
			else if (this.playerAtRightEdge()) {
				this.fadeTransition(new Forest6(Forest6.spawnLeft));
			}
		}
	}
}