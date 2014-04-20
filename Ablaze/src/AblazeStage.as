package
{		
	import org.flixel.FlxCamera;
	import org.flixel.FlxG;
	import org.flixel.FlxRect;
	import org.flixel.FlxState;
	
	public class AblazeStage extends FlxState
	{
		public static var stage:AblazeStage;
		
		public var player:Player;
		protected var scene:AblazeScene;
		public var drape:Drape;
		
		public function AblazeStage(scene:AblazeScene)
		{
			super();
			this.scene = scene;
			stage = this;
		}
		
		override public function create():void {
			this.add(this.scene);
			this.player = new Player(this.scene.startLocation().x, this.scene.startLocation().y);
			this.drape = new Drape(this.scene.startLocation().x+20, this.scene.startLocation().y);
			
			//TODO: once player is implemented as FlxGroup, adding player should add all its elements
			this.add(this.player.smokeEmmitter);
			this.add(this.player.fireEmitter);
			this.add(this.player);
			
			this.add(this.drape);
			this.add(this.drape.fireEmitter);
			
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