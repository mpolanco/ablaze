package Levels.Forest
{
	import Area.RectangleArea;
	
	import Levels.Forest1Level;
	
	import State.PlayState;
	
	import Text.AblazeText;
	
	import org.flixel.FlxPoint;
	import org.flixel.FlxText;
	
	public class Forest1 extends PlayState
	{
		//TODO: formalize spawn location
		public static const spawnRight:FlxPoint = new FlxPoint(620, 200);
		
		public function Forest1(spawn:FlxPoint)
		{
			super(Forest1Level, spawn);
			text = new Array();
		}
		
		override public function create():void {
			super.create();
			addTextObjects();
		}
		
		public function addTextObjects():void {
			var text1:AblazeText = new AblazeText(200,150,50,
				new RectangleArea(120, 150, 50, 50, false), "Lost");
			var text2:AblazeText = new AblazeText(250,250,100,
				new RectangleArea(190, 260, 50, 50, false), "Alone");
			var text3:AblazeText = new AblazeText(300,250,300,
				new RectangleArea(280, 310, 200, 50, false), "Afraid");
			
			text.push(text1,text2,text3);
			
			this.level.masterLayer.add(text1);
			this.level.masterLayer.add(text2);
			this.level.masterLayer.add(text3);
		}
		
		override public function update():void {
			super.update();
			if (this.playerAtRightEdge()) { // if player exits to the right
				for (var i:Number=0; i < text.length; i++) {
					this.level.masterLayer.remove((text[i] as AblazeText));
				}
				this.fadeTransition(new Forest2(Forest2.spawnLeft));
			}
		}
		
	}
}