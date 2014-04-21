package Theatre
{
	public class SetPiece
	{
		private var _tilemapCSV:Class;
		private var _tilesPNG:Class;
		private var _tileWidth:Number;
		private var _tileHeight:Number;
		private var _collideIndex:Number;
		
		/**
		 * Struct for passing tilemap info
		 */
		public function SetPiece(tilemapCSV:Class, tilesPNG, tileWidth:Number, tileHeight:Number, collideIndex:Number=1)
		{
			this._tilemapCSV = tilemapCSV;
			this._tilesPNG = tilesPNG;
			this._tileWidth = tileWidth;
			this._tileHeight = tileHeight;
			this._collideIndex = collideIndex;
		}

		public function get tilemapCSV():Class
		{
			return _tilemapCSV;
		}

		public function get tilesPNG():Class
		{
			return _tilesPNG;
		}

		public function get tileWidth():Number
		{
			return _tileWidth;
		}

		public function get tileHeight():Number
		{
			return _tileHeight;
		}

		public function get collideIndex():Number
		{
			return _collideIndex;
		}
	}
}