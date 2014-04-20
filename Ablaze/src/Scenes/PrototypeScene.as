package Scenes
{
	import org.flixel.FlxPoint;

	public class PrototypeScene extends AblazeScene
	{	
		[Embed(source = "../../assets/scenes/prototype/mapCSV_Scene_Map.csv", mimeType = "application/octet-stream")]
		private static var MapCSV:Class;
		[Embed(source = "../../assets/art/tiles.png")]
		private static var MapTilesPNG:Class;
		
		[Embed(source = "../../assets/scenes/prototype/mapCSV_Scene_Background.csv", mimeType = "application/octet-stream")] 
		private static var BackgroundCSV:Class;
		[Embed(source = "../../assets/art/background.png")]
		private static var BackgroundTilesPNG:Class;
		
		public function PrototypeScene()
		{
			super(MapCSV, MapTilesPNG, BackgroundCSV, BackgroundTilesPNG);
		}
		
		override public function startLocation():FlxPoint {
			return new FlxPoint(150, 120);
		}
	}
}