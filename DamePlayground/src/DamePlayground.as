package
{
	import org.flixel.FlxGame;
	
	[SWF(width="640", height="480", backgroundColor="#000000")]
	
	public class DamePlayground extends FlxGame
	{
		public function DamePlayground()
		{
			super(320, 240, Playground, 2, 60, 60);
			
			forceDebugger = true;
		}
	}
}