package Area
{
	import org.flixel.FlxG;
	import org.flixel.FlxPoint;

	public class CircleArea extends AreaImpl
	{
		public var radius:Number;
		public function CircleArea(X:Number, Y:Number, Radius:Number, Type:String = null)
		{
			super(X, Y, Type);
			this.radius = Radius;
		}
		
		override public function isInsideArea(x:Number, y:Number):Boolean {
			var dist:Number = Math.sqrt( Math.pow((this.x - x),2) + Math.pow((this.y - y),2))
			if (dist < this.radius) {
				return true;
			}
			return false;
		}
		
		override public function randomPointInsideArea():FlxPoint {
			for (var i:Number = 0; i < 5; i++) {
				var point:FlxPoint = new FlxPoint();
				point.x = this.x + FlxG.random()*(2*this.radius) - this.radius;
				point.y = this.y + FlxG.random()*(2*this.radius) - this.radius;
				if (this.isInsideArea(point.x, point.y)) {
					return point;
				}
			} 
			return new FlxPoint(this.x,this.y);
		}
	}
}