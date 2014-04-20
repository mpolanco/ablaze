package
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxObject;
	import org.flixel.FlxPoint;
	import org.flixel.FlxTilemap;
	
	public class AblazeScene extends FlxGroup
	{	
		protected var background:FlxTilemap;
		protected var map:FlxTilemap;
		
		public function AblazeScene(mapCSV:Class, mapTilesPNG:Class, backgroundCSV:Class, backgroundTilesPNG:Class)
		{
			super();
			this.initBackground(backgroundCSV, backgroundTilesPNG);
			this.initMap(mapCSV, mapTilesPNG);
			this.addElements();
		}
		
		// Public methods
		
		public function startLocation():FlxPoint {
			return new FlxPoint(0,0);
		}
		
		public function width():Number {
			return this.map.width;
		}
		
		public function height():Number {
			return this.map.height;
		}
		
		// Private methods
		
		private function initMap(mapCSV:Class, mapTilesPNG:Class):void {
			this.map = new FlxTilemap;
			this.map.loadMap(new mapCSV, mapTilesPNG, 16, 16, 0, 0, 1, 31);
			this.map.setTileProperties(40, FlxObject.UP, null, null, 4);
		}
		
		private function initBackground(backgroundCSV:Class, backgroundTilesPNG:Class):void {
			this.background = new FlxTilemap;
			this.background.loadMap(new backgroundCSV, backgroundTilesPNG, 192, 336);
			this.background.setTileProperties(1, FlxObject.NONE);
			this.background.scrollFactor.x = 0.9; // parallax
		}
		
		private function addElements():void {
			// Order of adding affects how layers get stacked/drawn
			this.add(this.background);
			this.add(this.map);
		}
	}
}