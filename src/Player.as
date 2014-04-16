
package {	
	import ParticleEmitters.SmokeEmitter;
	
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;

	public class Player extends FlxSprite{
		[Embed(source='res/player.png')]
		public static var ImgPlayer:Class;
		
		public var maxHealth:int;
		public var phenotypes:Array;
		public var smokeEmmitter:SmokeEmitter;
		
		public function Player(x:int, y:int) {
			this.x = x;
			this.y = y;
			this.loadGraphic(ImgPlayer, true, true, 14, 15);
			//SETTING ANIMATIONS
			this.addAnimation("idle" /*name of animation*/, [0] /*used frames*/);
			this.addAnimation("walk", [0, 1, 2, 1], 5 /*frames per second*/);
			this.addAnimation("jump", [3]);
			
			this.maxVelocity.x = 80;
			this.maxVelocity.y = 200;
			this.acceleration.y = 200;
			this.drag.x = this.maxVelocity.x * 4;
			this.smokeEmmitter = new SmokeEmitter(this.x, this.y, 100);
			FlxG.camera.follow(this);
		}
		
		// This method is called often to update the state of the creature.
		override public function update():void {
			this.smokeEmmitter.x = this.x;
			this.smokeEmmitter.y = this.y;
		}
	}
}
