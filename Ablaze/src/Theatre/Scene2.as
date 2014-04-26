package Theatre
{
	import org.flixel.FlxCamera;
	import org.flixel.FlxG;
	import org.flixel.FlxRect;
	import org.flixel.FlxState;
	
	public class Scene2 extends FlxState
	{	
		public static var Scene:Scene2; // singleton
		protected var player:Player;
		//TODO: protected var map/tiles/platforms
		//TODO: protected var background
		
		public function Scene2(setSchematic:SetSchematic)
		{
			super();
			Scene = this;
			this.constructSet();
		}
		
		override public function create():void {
			this.addSet();
			
			FlxG.worldBounds = new FlxRect(0, 0, this.scene.width(), this.scene.height());
			FlxG.camera.setBounds(0, 0, this.scene.width(), this.scene.height());
			FlxG.camera.follow(player, FlxCamera.STYLE_PLATFORMER);
		}
		
		override public function update():void
		{
			super.update();
			FlxG.collide(player, scene);
		}
		
		// Private methods
		private function constructSet():void {
			//TODO: implement this
		}
		
		private function addSet():void {
			//TODO: implement this
		}
	}
}