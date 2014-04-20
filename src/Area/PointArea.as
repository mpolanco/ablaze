package Area
{
	import org.flixel.FlxPoint;

	public class PointArea extends AreaImpl
	{
		public function PointArea(X:Number, Y:Number)
		{
			super(X, Y);
		}
		override public function isInsideArea(x:Number, y:Number):Boolean
		{
			if (x == this.x && y == this.y)
			{
				return true;
			}
			return false;
		}
		override public function randomPointInsideArea():FlxPoint
		{
			return new FlxPoint(this.x,this.y);
		}
	}
}