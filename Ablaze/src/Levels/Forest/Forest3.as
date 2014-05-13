package Levels.Forest
{
	import Levels.Forest3Level;
	
	import State.PlayState;
	
	import org.flixel.FlxG;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSound;
	import org.flixel.plugin.photonstorm.FlxControl;
	
	public class Forest3 extends PlayState
	{
		[Embed (source="../assets/sounds/Thunder Clap-SoundBible.com-1913038465.mp3")] private static var thunder:Class;
		
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
			
			if (this.player.x > 320 && !PlayState.Raining && this.player.velocity.y == 0) {
//				FlxControl.player1.enabled = false;
//				this.player.velocity.x = 0
				function onLightning1Complete():void {
					FlxG.flash(0xffbbbbbb, 4, onLightning2Complete);
					FlxG.play(thunder);
				}
				function onLightning2Complete():void {
//					FlxControl.player1.enabled = true;
				}
				FlxG.flash(0xffbbbbbb, 2, onLightning1Complete);
				FlxG.play(thunder, .5);
				PlayState.Raining = true;
			}
			
		}
		
//		private function exitLeft():Boolean {
//			return this.player.x <= 1;
//		}
	}
}