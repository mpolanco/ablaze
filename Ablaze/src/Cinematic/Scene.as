package Cinematic
{
	import org.flixel.FlxCamera;
	import org.flixel.FlxG;
	import org.flixel.FlxRect;
	import org.flixel.FlxState;
	import org.flixel.FlxTilemap;
	
	/**
	 * Background - contains backdrops in order w/ parallax indices
	 * Foreground - contains platforms, player (other actor), objects
	 * FX - lighting/weather
	 */
	public class Scene extends FlxState
	{	
		private static var _scene:Scene; // singleton
		private var _player:Player;
		private var _platforms:FlxTilemap;
		private var _backdrops:Array;
		
		public function Scene(foreground:Foreground, background:Background)
		{
			super();
			Scene._scene = this;
			this.constructForeground(foreground);
			this.constructBackground(background);
		}
		
		override public function create():void {
			this.addBackground();
			this.addForeground();
			
			FlxG.worldBounds = new FlxRect(0, 0, this.platforms.width, this.platforms.height);
			FlxG.camera.setBounds(0, 0, this.platforms.width, this.platforms.height);
			FlxG.camera.follow(this._player, FlxCamera.STYLE_PLATFORMER);
		}
		
		override public function update():void
		{
			super.update();
			FlxG.collide(player, this.platforms);
			//TODO: should player collide with objects?
		}
		
		// Private methods
		private function constructForeground(foreground:Foreground):void {
			//player layer
			var playerTilemap:FlxTilemap = foreground.playerLayer.tilemap();
			for (var ty:int = 0; ty < playerTilemap; ty++)
			{
				for (var tx:int = 0; tx < playerTilemap.widthInTiles; tx++)
				{
					if (playerTilemap.getTile(tx, ty) == 1)
					{
						if (!this._player) 
						{
							this._player = new Player(tx*foreground.playerLayer.tileWidth, ty*foreground.playerLayer.tileHeight);
						}
						else 
						{
							//TODO: error if more than one player is set
							trace("ERROR: multiple players in CSV");
						}
					}
				}
			}
			//platforms layer
			this._platforms = foreground.platformsLayer.tilemap();
			//object layers
		}
		
		private function constructBackground(background:Background):void {
			for each (var backdrop:Backdrop in background.backdrops) {
				var backdropTilemap:FlxTilemap = backdrop.layer.tilemap();
				backdropTilemap.scrollFactor.x = backdrop.parallax;
				this._backdrops.push(backdropTilemap);
			}
			//TODO: should this be reversed or not??
			this._backdrops.reverse();
		}
		
		private function addBackground():void {
			for each (var backdrop:FlxTilemap in this._backdrops) {
				this.add(backdrop);
			}
		}
		
		private function addForeground():void {
			this.add(this._platforms);
			//TODO: add objects
			this.add(this._player);
		}
		
		// Getters

		public static function get scene():Scene
		{
			return _scene;
		}
		
		public function get platforms():FlxTilemap
		{
			return _platforms;
		}

		public function get player():Player
		{
			return _player;
		}


	}
}
/*
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
*/

/*
package Theatre
{		
import org.flixel.FlxCamera;
import org.flixel.FlxG;
import org.flixel.FlxRect;
import org.flixel.FlxState;

//TODO: should Stage really be Scene, and Scene really be SceneSchematic?
public class Stage extends FlxState
{
public static var stage:Stage;

public var player:Player;
protected var scene:Scene;
public var drape:Drape;

public function Stage(scene:Scene)
{
super();
this.scene = scene;
stage = this;
}

override public function create():void {
this.add(this.scene);
//this.player = new Player(this.scene.startLocation().x, this.scene.startLocation().y);
//this.drape = new Drape(this.scene.startLocation().x+20, this.scene.startLocation().y);

//TODO: once player is implemented as FlxGroup, adding player should add all its elements
this.add(this.player.smokeEmitter);
this.add(this.player.fireEmitter);
this.add(this.player);

this.add(this.drape);
this.add(this.drape.fireEmitter);

FlxG.worldBounds = new FlxRect(0, 0, this.scene.width(), this.scene.height());
FlxG.camera.setBounds(0, 0, this.scene.width(), this.scene.height());
FlxG.camera.follow(player, FlxCamera.STYLE_PLATFORMER);
}

override public function update():void
{
super.update();
FlxG.collide(player, scene);
}
}
}
*/