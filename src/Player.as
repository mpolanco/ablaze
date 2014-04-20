
package {	
	import Area.PointArea;
	
	import ParticleEmitters.FireEmitter;
	import ParticleEmitters.FireSprite;
	import ParticleEmitters.SmokeEmitter;
	
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;

	public class Player extends FlxSprite{
		[Embed(source='../assets/art/player.png')]
		public static var ImgPlayer:Class;

		public var smokeEmmitter:SmokeEmitter;
		public var fireEmitter:FireEmitter;
		public var fireSprite:FireSprite;
		
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
			this.alpha = 0;
			this.drag.x = this.maxVelocity.x * 4;
			this.smokeEmmitter = new SmokeEmitter(this.x, this.y, 100);
			this.fireEmitter = new FireEmitter(new PointArea(this.x,this.y), this.x, this.y, 100);
			FlxG.camera.follow(this);
		}
		
		override public function update():void {
			this.smokeEmmitter.x = this.x;
			this.smokeEmmitter.y = this.y;
			this.fireEmitter.x = this.x+7;
			this.fireEmitter.y = this.y+7;
		}
	}
}
