package  
{
	import Sound.SoundMaker;
	
	import org.flixel.FlxGame;
	import org.flixel.FlxSound;
	[SWF(width="640", height="480", backgroundColor="#000000")]
	
	public class Ablaze extends FlxGame
	{
		public static var musicPlaying:Boolean = false;
		public function Ablaze() 
		{
			super(320,240,MenuState,2);
//			SoundMaker.ForestTheme.play();
		} 
	}
}