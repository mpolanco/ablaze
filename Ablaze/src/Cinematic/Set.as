package Cinematic
{
	public class Set
	{
		private var _playerSchematic:Layer;
		private var _mapSchematic:Layer;
		private var _backgroundSchematic:Layer;
		
		public function Set()
		{
		}

		public function get playerSchematic():Layer
		{
			return _playerSchematic;
		}

		public function get mapSchematic():Layer
		{
			return _mapSchematic;
		}

		public function get backgroundSchematic():Layer
		{
			return _backgroundSchematic;
		}


	}
}