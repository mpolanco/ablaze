package Theatre
{		
	import org.flixel.FlxCamera;
	import org.flixel.FlxG;
	import org.flixel.FlxRect;
	import org.flixel.FlxState;
	
	//TODO: should Stage really be Scene, and Scene really be SceneSchematic?
	public class Stage extends FlxState
	{
		public static var stage:Stage;
		
		public var player:Player;
		protected var scene:Scene;
		public var drape:Drape;
		
		public function Stage(scene:Scene)
		{
			super();
			this.scene = scene;
			stage = this;
		}
		
		override public function create():void {
			this.add(this.scene);
			//this.player = new Player(this.scene.startLocation().x, this.scene.startLocation().y);
			//this.drape = new Drape(this.scene.startLocation().x+20, this.scene.startLocation().y);
			
			//TODO: once player is implemented as FlxGroup, adding player should add all its elements
			this.add(this.player.smokeEmitter);
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