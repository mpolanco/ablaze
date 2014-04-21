package Theatre
{
	public class SetSchematic
	{
		private var _playerSchematic:SetPieceSchematic;
		private var _mapSchematic:SetPieceSchematic;
		private var _backgroundSchematic:SetPieceSchematic;
		
		public function SetSchematic()
		{
		}

		public function get playerSchematic():SetPieceSchematic
		{
			return _playerSchematic;
		}

		public function get mapSchematic():SetPieceSchematic
		{
			return _mapSchematic;
		}

		public function get backgroundSchematic():SetPieceSchematic
		{
			return _backgroundSchematic;
		}


	}
}