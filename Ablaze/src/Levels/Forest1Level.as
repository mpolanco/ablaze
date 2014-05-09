//Level code generated by custom Ablaze level exporter!

package Levels
{
	import org.flixel.*;
	public class Forest1Level extends BaseLevel
	{
		//Embedded media...
		[Embed(source="../../csv/levelCSV_Forest1_Map_Background.csv", mimeType="application/octet-stream")] public var CSV_MapBackground:Class;
		[Embed(source="../../assets/art/temp_background.png")] public var Img_MapBackground:Class;
		[Embed(source="../../csv/levelCSV_Forest1_Map_Platforms.csv", mimeType="application/octet-stream")] public var CSV_MapPlatforms:Class;
		[Embed(source="../../assets/art/tileset.png")] public var Img_MapPlatforms:Class;
		[Embed(source="../../csv/levelCSV_Forest1_FrontFX_Fade.csv", mimeType="application/octet-stream")] public var CSV_FrontFXFade:Class;
		[Embed(source="../../assets/art/fadebars.png")] public var Img_FrontFXFade:Class;

		//Tilemaps
		public var layerMapBackground:FlxTilemap;
		public var layerMapPlatforms:FlxTilemap;
		public var layerFrontFXFade:FlxTilemap;

		//Sprites
		public var PlayerEmberGroup:FlxGroup = new FlxGroup;


		public function Forest1Level(addToStage:Boolean = true, onAddSpritesCallback:Function = null)
		{
			// Generate maps.
			layerMapBackground = new FlxTilemap;
			layerMapBackground.loadMap( new CSV_MapBackground, Img_MapBackground, 320,480, FlxTilemap.OFF, 0, 1, 1 );
			layerMapBackground.x = 0.000000;
			layerMapBackground.y = 0.000000;
			layerMapBackground.scrollFactor.x = 1.000000;
			layerMapBackground.scrollFactor.y = 1.000000;
			layerMapPlatforms = new FlxTilemap;
			layerMapPlatforms.loadMap( new CSV_MapPlatforms, Img_MapPlatforms, 16,16, FlxTilemap.OFF, 0, 1, 1 );
			layerMapPlatforms.x = 0.000000;
			layerMapPlatforms.y = 0.000000;
			layerMapPlatforms.scrollFactor.x = 1.000000;
			layerMapPlatforms.scrollFactor.y = 1.000000;
			layerFrontFXFade = new FlxTilemap;
			layerFrontFXFade.loadMap( new CSV_FrontFXFade, Img_FrontFXFade, 128,480, FlxTilemap.OFF, 0, 1, 1 );
			layerFrontFXFade.x = 0.000000;
			layerFrontFXFade.y = 0.000000;
			layerFrontFXFade.scrollFactor.x = 1.000000;
			layerFrontFXFade.scrollFactor.y = 1.000000;

			//Add layers to the master group in correct order.
			masterLayer.add(layerMapBackground);
			masterLayer.add(layerMapPlatforms);
			masterLayer.add(PlayerEmberGroup);
			masterLayer.add(layerFrontFXFade);


			if ( addToStage )
			{
				addSpritesForLayerPlayerEmber(onAddSpritesCallback);
				FlxG.state.add(masterLayer);
			}

			mainLayer = layerMapPlatforms;

			boundsMinX = 0;
			boundsMinY = 0;
			boundsMaxX = 640;
			boundsMaxY = 480;

		}

		public function addSpritesForLayerPlayerEmber(onAddCallback:Function = null):void
		{
			addSpriteToLayer(Player, PlayerEmberGroup , 80.000, 160.000, 0.000, false, 1, 1, onAddCallback );//"Ember"
		}


	}
}
