package Theatre
{
	public class SetSchematic
	{
		private var _playerSchematic:SetPiece;
		private var _mapSchematic:SetPiece;
		private var _backgroundSchematic:SetPiece;
		
		public function SetSchematic()
		{
		}

		public function get playerSchematic():SetPiece
		{
			return _playerSchematic;
		}

		public function get mapSchematic():SetPiece
		{
			return _mapSchematic;
		}

		public function get backgroundSchematic():SetPiece
		{
			return _backgroundSchematic;
		}


	}
}