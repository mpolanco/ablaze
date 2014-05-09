package Levels.Forest
{
	import Levels.Forest1Level;
	
	import State.PlayState;
	
	import org.flixel.FlxPoint;
	
	public class Forest1 extends PlayState
	{
		//TODO: formalize spawn location
		public static const spawnRight:FlxPoint = new FlxPoint(620, 200);
		
		public function Forest1(spawn:FlxPoint)
		{
			super(Forest1Level, spawn);
		}
		
		override public function update():void {
			super.update();
			if (this.playerAtRightEdge()) { // if player exits to the right
				this.fadeTransition(new Forest2(Forest2.spawnLeft));
			}
		}
		
	}
}