package Levels.Forest
{
	import Levels.Forest6Level;
	
	import Sound.SoundMaker;
	
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
			SoundMaker.ForestTheme.volume = .5;
			SoundMaker.EvilBackground.volume = .5;
		}
		override public function update():void {
			super.update();
			if (this.playerAtLeftEdge()) {
				PlayState.Raining = true;
				SoundMaker.EvilBackground.volume = .2;
				SoundMaker.ForestTheme.volume = 1;
				this.fadeTransition(new Forest5(Forest5.spawnRight));
			} 
			else if (this.playerAtRightEdge()) {
				this.fadeTransition(new Forest6(Forest6.spawnLeft));
			}
		}
	}
}