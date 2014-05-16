package Levels.Forest
{
	import Area.RectangleArea;
	
	import Levels.Forest3Level;
	
	import Sound.SoundMaker;
	
	import State.PlayState;
	
	import Text.AblazeText;
	
	import org.flixel.FlxG;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSound;
	import org.flixel.plugin.photonstorm.FlxControl;
	
	public class Forest3 extends PlayState
	{
		[Embed (source="../../../assets/sounds/Thunder Clap-SoundBible.com-1913038465.mp3")] private static var thunder:Class;
		
		public static const spawnLeft:FlxPoint = new FlxPoint(5, 200);
		public static const spawnRight:FlxPoint = new FlxPoint(620, 200);
		
		public function Forest3(spawn:FlxPoint)
		{
			super(Forest3Level, spawn);
			text = new Array;
		}
		
		override public function create():void {
			super.create();
			addTextObjects();
		}
		
		public function addTextObjects():void {
			var text1:AblazeText = new AblazeText(130,200,50,
				new RectangleArea(90, 250, 60, 50, false), "Home");
			var text2:AblazeText = new AblazeText(200,180,100,
				new RectangleArea(200, 240, 80, 60, false), "Go Home");
			var text3:AblazeText = new AblazeText(300,220,300,
				new RectangleArea(315, 250, 300, 200, false), "I Don't belong...");
			
			text.push(text1,text2,text3);
			
			this.level.masterLayer.add(text1);
			this.level.masterLayer.add(text2);
			this.level.masterLayer.add(text3);
		}
		
		override public function update():void {
			super.update();
			if (this.playerAtLeftEdge()) {
				killText();
				this.fadeTransition(new Forest2(Forest2.spawnRight));
			}else if (this.playerAtRightEdge()) {
				killText();
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
				SoundMaker.EvilBackground.play();
				SoundMaker.EvilBackground.volume = .2;
				PlayState.Raining = true;
				SoundMaker.ForestTheme.stop();
				SoundMaker.MainTheme1Loop.play();
			}
			
		}
		
//		private function exitLeft():Boolean {
//			return this.player.x <= 1;
//		}
	}
}