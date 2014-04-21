package Scenes
{
	import Theatre.Scene;
	import Theatre.SetSchematic;

	public class PrototypeScene extends Scene
	{	
		[Embed(source = "../../assets/scenes/prototype/mapCSV_Scene_Map.csv", mimeType = "application/octet-stream")]
		private static var MapCSV:Class;
		[Embed(source = "../../assets/art/tiles.png")]
		private static var MapTilesPNG:Class;
		
		[Embed(source = "../../assets/scenes/prototype/mapCSV_Scene_Background.csv", mimeType = "application/octet-stream")] 
		private static var BackgroundCSV:Class;
		[Embed(source = "../../assets/art/background.png")]
		private static var BackgroundTilesPNG:Class;
		
		//[Embed(source = "../../assets/scenes/prototype/mapCSV_Scene_Player.csv", mimeType = "application/octet-stream")] 
		private static var PlayerCSV:Class;
		[Embed(source = "../../assets/art/player.png")]
		private static var PlayerPNG:Class;
		
		public function PrototypeScene()
		{
			
			super(new SetSchematic());
		}
	}
}