package Area
{
	import org.flixel.FlxPoint;
	
	public class Rectangle implements Area
	{
		public var x:Number;
		public var y:Number;
		public var width:Number;
		public var height:Number;
		
		public function Rectangle(X:Number, Y:Number, Width:Number=0, Height:Number=0)
		{
			x=X;
			y=Y;
			width=Width;
			height=Height;
		}
		
		public function isInsideArea(x:Number,y:Number):Boolean
		{
			isInside = true;
			
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
		
		public function randomPointInsideArea():FlxPoint
		{
			point = new FlxPoint();
			point.x = this.x + FlxG.random()*(this.width);
			point.y = this.y + FlxG.random()*(this.height);
			
			return point;
		}
	}
}