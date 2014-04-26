package Cinematic
{
	public class Background
	{
		private var _backdrops:Array;
		public function Background(backdrops:Array)
		{
			this._backdrops = backdrops;
		}

		public function get backdrops():Array
		{
			return _backdrops;
		}
	}
}