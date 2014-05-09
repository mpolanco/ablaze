package
{
	import flash.errors.IllegalOperationError;

	/**
	 * Class acts as singleton.
	 * 
	 * Asset naming convention :
	 * 		filename		:: camelCase.extension (e.g. helloWorld.txt)
	 * 		attribute name	:: filenameEXTENSTION (e.g. hello.txt -> helloTXT)
	 * 
	 * NB: Static attribute names start with lower case as they are emulating a singleton's instance attributes.
	 */
	public class Assets
	{
		// .png assets
		[Embed(source = "../assets/art/drape.png")] 		public static const  drapePNG:Class;
		[Embed(source = '../assets/art/hut.png')] 			public static const hutPNG:Class;
		[Embed(source = "../assets/art/nutmeg.png")] 		public static const  nutmegPNG:Class;
		[Embed(source = "../assets/art/player.png")] 		public static const  playerPNG:Class;
		[Embed(source = "../assets/art/radialDot.png")] 	public static const  radialDotPNG:Class;
		[Embed(source = "../assets/art/smoke.png")] 		public static const  smokePNG:Class;
		[Embed(source = "../assets/art/temp_background.png")] 	public static const  temp_backgroundPNG:Class;
		[Embed(source = "../assets/art/tiles.png")] 		public static const  tilesPNG:Class;
		[Embed(source = "../assets/art/title.png")] 		public static const  titlePNG:Class;
		
		// music assets
		
		// sound assets
		[Embed(source = "../assets/sounds/jump.mp3")]
		public static const  jumpMP3:Class;
			
		/**
		 * @throws IllegalOperationError Enforces singleton policy
		 */
		public function Assets()
		{
			throw new IllegalOperationError("Cannot instantiate more than one AssetManager singleton");
		}
	}
}