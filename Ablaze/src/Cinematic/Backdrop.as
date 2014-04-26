package Cinematic
{
	public class Backdrop
	{
		private var _layer:Layer;
		private var _parallax:Number;
		
		public function Backdrop(layer:Layer, parallax:Number)
		{
			this._layer = layer;
			this._parallax = parallax;
		}
		
		public function get layer():Layer
		{
			return _layer;
		}

		public function get parallax():Number
		{
			return _parallax;
		}
	}
}