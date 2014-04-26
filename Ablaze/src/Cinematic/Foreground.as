package Cinematic
{
	public class Foreground
	{
		private var _playerLayer:Layer;
		private var _platformsLayer:Layer;
		private var _objectLayers:Array;
		
		//TODO: should object layers be a ...rest variable??
		public function Foreground(playerLayer:Layer, platformsLayer:Layer, objectLayers:Array=null)
		{
			this._playerLayer = playerLayer;
			this._platformsLayer = platformsLayer;
			this._objectLayers = objectLayers;
		}
		
		public function get playerLayer():Layer
		{
			return _playerLayer;
		}

		public function get platformsLayer():Layer
		{
			return _platformsLayer;
		}

		public function get objectLayers():Array
		{
			return _objectLayers;
		}
	}
}