package
{
	import flash.errors.IllegalOperationError;

	/**
	 * Class acts as singleton
	 */
	public class AssetManager
	{
		// .png assets
		[Embed(source = "../assets/art/background.png")] 	public static const  backgroundPNG:Class;
		[Embed(source = "../assets/art/drape.png")] 		public static const  drapePNG:Class;
		[Embed(source = "../assets/art/nutmeg.png")] 		public static const  nutmegPNG:Class;
		[Embed(source = "../assets/art/player.png")] 		public static const  playerPNG:Class;
		[Embed(source = "../assets/art/radialDot.png")] 	public static const  radialDotPNG:Class;
		[Embed(source = "../assets/art/smoke.png")] 		public static const  smokePNG:Class;
		[Embed(source = "../assets/art/tiles.png")] 		public static const  tilesPNG:Class;
		[Embed(source = "../assets/art/title.png")] 		public static const  titlePNG:Class;
		
		// .csv assets
		[Embed(source = "../assets/scenes/prototype/mapCSV_Scene_Background.csv", mimeType = "application/octet-stream")]
		public static const  prototypeBackgroundCSV:Class;
		[Embed(source = "../assets/scenes/prototype/mapCSV_Scene_Map.csv", mimeType = "application/octet-stream")]
		public static const  prototypeMapCSV:Class;
			
		/**
		 * @throws IllegalOperationError Enforces singleton policy
		 */
		public function AssetManager()
		{
			throw new IllegalOperationError("Cannot instantiate more than one AssetManager singleton");
		}
	}
}