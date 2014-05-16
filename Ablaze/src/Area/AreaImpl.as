package Area
{
	import org.flixel.FlxPoint;
	
	public class AreaImpl implements Area, Updateable
	{
		public var x:Number;
		public var y:Number;
		public var type:String;
		
		public function AreaImpl(X:Number, Y:Number, Type:String = "")
		{
			this.x = X;
			this.y = Y;
			this.type = Type;
		}
		
		public function isInsideArea(x:Number, y:Number):Boolean
		{
			return false;
		}
		
		public function randomPointInsideArea():FlxPoint
		{
			return null;
		}
		
		public function update():void{
			
		}
	}
}