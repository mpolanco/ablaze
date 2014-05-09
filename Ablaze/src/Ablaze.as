package  
{
	import org.flixel.FlxGame;
	import org.flixel.FlxSound;
	[SWF(width="640", height="480", backgroundColor="#000000")]
	
	public class Ablaze extends FlxGame
	{
		[Embed (source="../assets/sounds/ablaze_forest_theme_sample.mp3")] private static var forestTheme:Class;
		
		public var FlxMainMenuMusic : FlxSound = new FlxSound();
		public static var musicPlaying:Boolean = false;
		public function Ablaze() 
		{
			super(320,240,MenuState,2);
//			super(1080, 810, MenuState, 1);
			FlxMainMenuMusic.loadEmbedded(forestTheme,true);
			FlxMainMenuMusic.play();
		}
	}
}