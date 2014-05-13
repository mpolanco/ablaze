package Sound
{
	import org.flixel.FlxSound;
	public class SoundMaker
	{
		[Embed (source="../assets/sounds/ablaze_forest_theme_sample.mp3")] private static var forestTheme:Class;
		[Embed (source="../assets/sounds/evil_bgm_0.mp3")] private static var evil:Class;
		
		public static var ForestTheme : FlxSound = new FlxSound();
		ForestTheme.loadEmbedded(forestTheme,true);
		
		public static var EvilBackground: FlxSound = new FlxSound();
		EvilBackground.loadEmbedded(evil, true);
		
		public function SoundMaker()
		{
			
		}
	}
}