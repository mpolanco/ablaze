package Levels.Forest
{
	import Levels.Forest4Level;
	
	import State.PlayState;
	
	import Text.AblazeText;
	
	import Area.RectangleArea;
	
	import org.flixel.FlxPoint;
	
	public class Forest4 extends PlayState
	{
		public static const spawnLeft:FlxPoint = new FlxPoint(5, 200);
		public static const spawnRight:FlxPoint = new FlxPoint(620, 200);
		
		public function Forest4(spawn:FlxPoint=null)
		{
			super(Forest4Level, spawn);
			text = new Array();
		}
		
		override public function create():void {
			super.create();
			addTextObjects();
		}
		
		public function addTextObjects():void {
			var text1:AblazeText = new AblazeText(130,200,50,
				new RectangleArea(70, 250, 60, 50, false), "It Hurts");
			var text2:AblazeText = new AblazeText(200,180,100,
				new RectangleArea(140, 240, 80, 60, false), "Hide");
			var text3:AblazeText = new AblazeText(300,220,300,
				new RectangleArea(300, 240, 300, 200, false), "I Don't belong...");
			
			text.push(text1,text2,text3);
			
			this.level.masterLayer.add(text1);
			this.level.masterLayer.add(text2);
			this.level.masterLayer.add(text3);
		}
		
		override public function update():void {
			super.update();
			if (this.playerAtLeftEdge()) {
				this.hut.kill();
				killText();
				this.fadeTransition(new Forest3(Forest3.spawnRight));
			} 
			else if (this.playerAtRightEdge()) {
				this.hut.kill();
				killText();
				this.fadeTransition(new Forest5(Forest5.spawnLeft));
			}
		}
	}
}