package
{		
	import org.flixel.FlxCamera;
	import org.flixel.FlxG;
	import org.flixel.FlxRect;
	import org.flixel.FlxState;
	
	public class AblazeStage extends FlxState
	{
		protected var player:Player;
		protected var scene:AblazeScene;
		
		public function AblazeStage(scene:AblazeScene)
		{
			super();
			this.scene = scene;
		}
		
		override public function create():void {
			this.add(this.scene);
			this.player = new Player(this.scene.startLocation().x, this.scene.startLocation().y);
			
			//TODO: once player is implemented as FlxGroup, adding player should add all its elements
			this.add(this.player.smokeEmmitter);
			this.add(this.player.fireEmitter);
			this.add(this.player);
			
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