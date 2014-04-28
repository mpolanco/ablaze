package Levels
{
	import org.flixel.FlxPoint;

	public class TestLevel extends PlaygroundLevel
	{
		
		[Embed(source = "../../assets/levels/test/mapCSV_Scene_Map.csv", mimeType = "application/octet-stream")]
		private static var MapCSV:Class;
		[Embed(source = "../../assets/art/tiles.png")]
		private static var MapTilesPNG:Class;
		
		[Embed(source = "../../assets/levels/test/mapCSV_Scene_Background.csv", mimeType = "application/octet-stream")] 
		private static var BackgroundCSV:Class;
		[Embed(source = "../../assets/art/background.png")]
		private static var BackgroundTilesPNG:Class;
		
		public function TestLevel()
		{
			super(MapCSV, MapTilesPNG, BackgroundCSV, BackgroundTilesPNG);
		}
		
		override public function playerLocation():FlxPoint {
			return new FlxPoint(4,120);
		}
	}
}