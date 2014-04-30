package Levels.Forest
{
	import Levels.Forest1Level;
	
	import State.PlayState;
	
	import org.flixel.FlxPoint;
	
	public class Forest1 extends PlayState
	{
		//TODO: formalize spawn location
		public static const spawnRight:FlxPoint = new FlxPoint(450, 200);
		
		public function Forest1(spawn:FlxPoint)
		{
			super(Forest1Level, spawn);
		}
		
		override public function update():void {
			super.update();
			if (this.exitRight()) { // if player exits to the right
				this.fadeTransition(new Forest2(Forest2.spawnLeft));
			}
		}
		
		private function exitRight():Boolean {
			return (this.player.x >= 460);
		}
	}
}