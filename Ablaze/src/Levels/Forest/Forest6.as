package Levels.Forest
{
	import Levels.Forest6Level;
	
	import State.PlayState;
	
	import org.flixel.FlxPoint;
	
	public class Forest6 extends PlayState
	{
		public static const spawnLeft:FlxPoint = new FlxPoint(5, 200);
		public static const spawnRight:FlxPoint = new FlxPoint(620, 200);
		
		public function Forest6( spawn:FlxPoint=null)
		{
			super(Forest6Level, spawn);
		}
		override public function create():void {
			super.create();
			this.setDarkness(.8);
			PlayState.Raining = false;
		}
		override public function update():void {
			super.update();
			if (this.playerAtLeftEdge()) {
				this.fadeTransition(new Forest5(Forest5.spawnRight));
			} 
			else if (this.playerAtRightEdge()) {
				this.fadeTransition(new Forest6(Forest6.spawnLeft));
			}
		}
	}
}