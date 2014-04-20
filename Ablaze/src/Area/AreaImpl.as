package Area
{
	import org.flixel.FlxPoint;
	
	public class AreaImpl implements Area
	{
		public var x:Number;
		public var y:Number;
		
		public function AreaImpl(X:Number, Y:Number)
		{
			this.x = X;
			this.y = Y;
		}
		
		public function isInsideArea(x:Number, y:Number):Boolean
		{
			return false;
		}
		
		public function randomPointInsideArea():FlxPoint
		{
			return null;
		}
	}
}