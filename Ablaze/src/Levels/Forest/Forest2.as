package Levels.Forest
{
	import Levels.Forest2Level;
	
	import Sound.SoundMaker;
	import Area.RectangleArea;
	
	import State.PlayState;
	
	import Text.AblazeText;
	
	import org.flixel.FlxPoint;
	
	public class Forest2 extends PlayState
	{
		public static const spawnLeft:FlxPoint = new FlxPoint(5, 200);
		public static const spawnRight:FlxPoint = new FlxPoint(620, 200);
		
		public function Forest2(spawn:FlxPoint)
		{
			super(Forest2Level, spawn);
			text = new Array();
		}
		
		override public function create():void {
			super.create();
			SoundMaker.MainTheme1Loop.stop();
			SoundMaker.ForestTheme.play();
			addTextObjects();
		}
		public function addTextObjects():void {
			var text1:AblazeText = new AblazeText(200,350,50,
				new RectangleArea(180, 370, 50, 50, false), "Jump");
			var text2:AblazeText = new AblazeText(300,300,100,
				new RectangleArea(290, 350, 80, 60, false), "Higher!");
			var text3:AblazeText = new AblazeText(300,220,300,
				new RectangleArea(420, 250, 50, 50, false), "Closer...?");
			
			text.push(text1,text2,text3);
			
			this.level.masterLayer.add(text1);
			this.level.masterLayer.add(text2);
			this.level.masterLayer.add(text3);
		}
		
		override public function update():void {
			super.update();
			if (this.playerAtLeftEdge()) {
				killText();
				this.fadeTransition(new Forest1(Forest1.spawnRight));
			}else if (this.playerAtRightEdge()) {
				killText();
				this.fadeTransition(new Forest3(Forest3.spawnLeft));
			}
		}
		
		public function killText():void {
			for (var i:Number=0; i < text.length; i++) {
				this.level.masterLayer.remove((text[i] as AblazeText));
			}
		}
		
//		private function exitLeft():Boolean {
//			return this.player.x <= 0;
//		}
//		
//		private function exitRight():Boolean {
//			return this.player.x + this.player.width >= 475;
//		}
	}
}