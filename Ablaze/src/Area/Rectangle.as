package Area
{
	import org.flixel.FlxG;
	import org.flixel.FlxPoint;
	
	public class Rectangle extends AreaImpl
	{
		public var width:Number;
		public var height:Number;
		
		public function Rectangle(X:Number, Y:Number, Width:Number=0, Height:Number=0)
		{
			super(X,Y);
			width=Width;
			height=Height;
		}
		
		override public function isInsideArea(x:Number,y:Number):Boolean
		{
			var isInside:Boolean = true;
			
			if (x < this.x) {
				isInside = false;
			}
			if (y < this.y) {
				isInside = false;
			}
			if (x > this.x + this.width) {
				isInside = false;
			}
			if (y > this.y + this.height) {
				isInside = false;
			}
			
			return isInside;
		}
		
		override public function randomPointInsideArea():FlxPoint
		{
			var point:FlxPoint = new FlxPoint();
			point.x = this.x + FlxG.random()*(this.width);
			point.y = this.y + FlxG.random()*(this.height);
			
			return point;
		}
	}
}