package Area
{
	import org.flixel.FlxPoint;

	public interface Area
	{
		function isInsideArea(x:Number,y:Number):Boolean;
		function randomPointInsideArea():FlxPoint;
	}
}