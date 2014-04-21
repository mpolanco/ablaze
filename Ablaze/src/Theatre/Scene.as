package Theatre
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxObject;
	import org.flixel.FlxPoint;
	import org.flixel.FlxTilemap;

	public class Scene extends FlxGroup
	{	
		protected var background:FlxTilemap;
		protected var map:FlxTilemap;
		public var player:Player;
		
		public function Scene(setSchematic:SetSchematic)
		{
			super();
			this.initBackground(setSchematic.backgroundSchematic);
			this.initMap(setSchematic.mapSchematic);
			this.initPlayer(setSchematic.playerSchematic);
			this.addElements();
		}
		
		//TODO: factory??
		
		// Public methods
		
		//TODO: remove this once player location is loaded from csv
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
		
		private function initBackground(background:SetPieceSchematic):void {
			this.background = new FlxTilemap;
			this.background.loadMap(new background.tilemapCSV, background.tilesPNG, background.tileWidth, background.tileHeight);
			this.background.setTileProperties(1, FlxObject.NONE);
			this.background.scrollFactor.x = 0.9; // parallax
		}
		
		private function initMap(map:SetPieceSchematic):void {
			this.map = new FlxTilemap;
			this.map.loadMap(new map.tilemapCSV, map.tilesPNG, map.tileWidth, map.tileHeight, 0, 0, 1, map.collideIndex);
			this.map.setTileProperties(40, FlxObject.UP, null, null, 4);
		}
		
		private function initPlayer(player:SetPieceSchematic):void {
			var playerMap:FlxTilemap = new FlxTilemap;
			playerMap.loadMap(new player.tilemapCSV, player.tilesPNG, player.tileWidth, player.tileHeight);
			for (var ty:int = 0; ty < playerMap.heightInTiles; ty++)
			{
				for (var tx:int = 0; tx < playerMap.widthInTiles; tx++)
				{
					if (playerMap.getTile(tx, ty) == 1)
					{
						if (!this.player) 
						{
							this.player = new Player(tx*player.tileWidth, ty*player.tileHeight);
						}
						else 
						{
							//TODO: error if more than one player is set
							trace("ERROR: multiple players in CSV");
						}
					}
				}
			}
		}
		
		private function addElements():void {
			// Order of adding affects how layers get stacked/drawn
			this.add(this.background);
			this.add(this.map);
			this.add(this.player);
		}
	}
}