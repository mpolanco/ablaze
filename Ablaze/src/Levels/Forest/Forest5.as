package Levels.Forest
{
	import Levels.Forest5Level;
	
	import State.PlayState;
	
	import Area.RectangleArea;
	
	import Text.AblazeText;
	
	import org.flixel.FlxPoint;
	
	public class Forest5 extends PlayState
	{
		public static const spawnLeft:FlxPoint = new FlxPoint(5, 200);
		public static const spawnRight:FlxPoint = new FlxPoint(620, 200);
		
		public function Forest5(spawn:FlxPoint=null)
		{
			super(Forest5Level, spawn);
			text = new Array();
		}
		
		override public function create():void {
			super.create();
			addTextObjects();
		}
		
		public function addTextObjects():void {
			var text1:AblazeText = new AblazeText(100,250,50,
				new RectangleArea(70, 100, 400, 400, false), "It Hurts");
			var text2:AblazeText = new AblazeText(180,270,50,
				new RectangleArea(150, 100, 400, 400, false), "Lost");
			var text3:AblazeText = new AblazeText(230,250,50,
				new RectangleArea(200, 100, 400, 400, false), "Scared");
			var text4:AblazeText = new AblazeText(280,270,50,
				new RectangleArea(250, 100, 400, 400, false), "Alone");
			var text5:AblazeText = new AblazeText(300,250,100,
				new RectangleArea(300, 300, 80, 60, false), "Which Way?");
			var text6:AblazeText = new AblazeText(300,220,300,
				new RectangleArea(300, 240, 300, 200, false), "I Don't belong...");
			
			text.push(text1,text2,text3,text4,text5,text6);
			
			this.level.masterLayer.add(text1);
			this.level.masterLayer.add(text2);
			this.level.masterLayer.add(text3);
			this.level.masterLayer.add(text4);
			this.level.masterLayer.add(text5);
			this.level.masterLayer.add(text6);
		}
		
		override public function update():void {
			super.update();
			if (this.playerAtLeftEdge()) {
				killText();
				this.fadeTransition(new Forest4(Forest4.spawnRight));
			} 
			else if (this.playerAtRightEdge()) {
				PlayState.Raining = false;
				killText();
				this.fadeTransition(new Forest6(Forest6.spawnLeft));
			}
		}
	}
}