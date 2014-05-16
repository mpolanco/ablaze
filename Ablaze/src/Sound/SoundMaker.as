package Sound
{
	import flash.events.TimerEvent;
	
	import org.flixel.FlxG;
	import org.flixel.FlxSound;

	public class SoundMaker
	{
		[Embed (source="../assets/sounds/ablaze_forest_theme_sample.mp3")] private static var forestTheme:Class;
		[Embed (source="../assets/sounds/evil_bgm_0.mp3")] private static var evil:Class;
		[Embed (source="../assets/sounds/fire-moving-crackle.mp3")] private static var movingFire:Class;
		[Embed (source="../assets/sounds/fire-whoosh2.mp3")] private static var fireWhooshSound:Class;
		[Embed (source="../assets/sounds/jump1.mp3")] private static var jump1Sound:Class;
		[Embed (source="../assets/sounds/jump2.mp3")] private static var jump2Sound:Class;
		[Embed (source="../assets/sounds/jump3.mp3")] private static var jump3Sound:Class;
		
		
		public static var ForestTheme : FlxSound = new FlxSound();
		ForestTheme.loadEmbedded(forestTheme,true);
		
		public static var EvilBackground: FlxSound = new FlxSound();
		EvilBackground.loadEmbedded(evil, true);
		
		public static var jump1:FlxSound = new FlxSound();
		jump1.loadEmbedded(jump1Sound);
		jump1.volume = .5;
		public static var jump2:FlxSound = new FlxSound();
		jump2.loadEmbedded(jump2Sound);
		jump2.volume = .5;
		public static var jump3:FlxSound = new FlxSound();
		jump3.loadEmbedded(jump3Sound);
		jump3.volume = .5;
		
		public static var fireWhoosh:FlxSound = new FlxSound();
		fireWhoosh.loadEmbedded(fireWhooshSound);
		
		public static var fireMove:FlxSound = new FlxSound();
		fireMove.loadEmbedded(movingFire,true);
		fireMove.volume = .4;
		
		
		public function SoundMaker()
		{
			
		}
		
		public static function playJump():void {
			var random:Number = FlxG.random();
			if (random < .33) {
				jump1.play(true);
			} else if (random < .66 && random >= .33) {
				jump2.play(true);
			} else {
				jump3.play(true);
			}
		}
		public static function playWhoosh(e:TimerEvent):void {
			fireWhoosh.play();
			fireMove.volume = 1;
		}
	}
}