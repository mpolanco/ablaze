
package {	
	import Area.PointArea;
	
	import ParticleEmitters.FireEmitter;
	import ParticleEmitters.SmokeEmitter;
	
	import Particles.LightCircle;
	
	import Sound.SoundMaker;
	
	import State.PlayState;
	
	import flash.display.Graphics;
	import flash.media.Sound;
	
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;
	import org.flixel.plugin.photonstorm.FlxControl;
	import org.flixel.plugin.photonstorm.FlxControlHandler;
	
	public class Player extends FlxSprite {
		
		public var eyes:FlxSprite;
		public var smokeEmitter:SmokeEmitter;
		public var fireEmitter:FireEmitter;
		public var lightCircle:LightCircle;
		
		[Embed(source = '../assets/art/ember_eyes.png')] private static var EyesPNG:Class;
		
		public function Player(x:int, y:int) {
			super(x, y);
			this.setupGraphics();
			this.addAnimations();
			this.ignite();
			this.setupControl();
		}
		
		private function setupGraphics():void {
			this.makeGraphic(19,26, 0x00ffffff, true);
			this.alpha = 0;
			this.eyes = new FlxSprite();
			this.eyes.loadGraphic(EyesPNG, true, true, 19, 26, true);
			
			// collision box
			//this.width = 12;
			//this.height = 16;
			
			// image offset from collision box
			//this.offset.x = 13;
			//this.offset.y = 20;			
		}
		
		public function addGraphics(group:FlxGroup):void {
			group.add(this.smokeEmitter);
			group.add(this.fireEmitter);
			group.add(this.eyes);
			group.add(this.lightCircle);
		}
		
		private function addAnimations():void {
			//TODO: this.finished is always false for looped animations... change animations to be played once (depending on animation)
			this.eyes.addAnimation( 'idle', [0,1,2,3], 10, true);
			this.eyes.addAnimation( 'sad', [4,5,6,7], 10, true);
			this.eyes.addAnimation( 'happy', [8,9,10,11], 10, true);
			this.eyes.addAnimation( 'blink', [12,13,14,15,16], 10, true);
			this.eyes.addAnimation( 'pumpin', [17,18,19,20,21,22,23,24,25], 10, true);
			
			this.eyes.play("idle");
		}
		
		private function setupControl():void {
			if (FlxG.getPlugin(FlxControl) == null)
			{
				FlxG.addPlugin(new FlxControl);
			}
			FlxControl.create(this, FlxControlHandler.MOVEMENT_ACCELERATES, FlxControlHandler.STOPPING_DECELERATES, 1, true, false); // sets up player1 attr of FlxControl
			FlxControl.player1.setCursorControl(false, false, true, true); // use only left & right arrow keys
			//TODO: should be KEYMODE_JUST_DOWN, but thats unresponsive... fix it!
			FlxControl.player1.setJumpButton("SPACE", FlxControlHandler.KEYMODE_PRESSED, 200, FlxObject.FLOOR, 250,0, SoundMaker.playJump);
			FlxControl.player1.setMovementSpeed(200, 0, 75, 200, 400, 0);
			FlxControl.player1.setGravity(0, 400);
			this.facing = FlxObject.RIGHT;
		}
		
		private function ignite():void {
			this.smokeEmitter = new SmokeEmitter(this.x, this.y, 100);
			this.fireEmitter = new FireEmitter(new PointArea(this.x,this.y), this.x, this.y, 100);
			this.lightCircle = new LightCircle(this.x, this.y, 256);
		}
		
		override public function update():void {
			super.update();
			trace(this.x + " " + this.y);
			this.updateEyes();
			this.updateEmitters();
			animateExpression();
			if (PlayState.state.level) {
				if (x < 0){ // keep player from falling off left side of map
					x = 0;
				}else if (x > PlayState.state.level.mainLayer.width - this.width) { // keep player from falling off right side of map
					x = PlayState.state.level.mainLayer.width - this.width;
				}
			}
		}
		
		private function updateEyes():void {
			this.eyes.x = this.x;
			this.eyes.y = this.y;
			this.eyes.facing = this.facing;
		}
		
		private function updateEmitters():void {
			this.smokeEmitter.x = this.x+(this.width/2.0)-(this.smokeEmitter.width/2.0);
			this.smokeEmitter.y = this.y+(this.height/2.0)-(this.smokeEmitter.height/2.0)-2;
			this.fireEmitter.x = this.x+(this.width/2.0)-(this.fireEmitter.width/2.0);
			this.fireEmitter.y = this.y+(this.height/2.0)-(this.fireEmitter.height/2.0)+5;
			this.lightCircle.x = this.x/lightCircle.scale.x;
			this.lightCircle.y = this.y/lightCircle.scale.y;
		}
		
		private function animateExpression():void {
			//TODO: this.finished is always false since all animations have looping set to true
			if (this.eyes.finished) {
				var emotion:String = determineEmotion();
				if (emotion != "") {
					this.eyes.play(emotion);
				}
				else {
					// make the player blink every one in a while
					if (Math.random() < 0.05) {
						this.eyes.play("blink");
					} else {
						this.eyes.play("idle");
					}	
				}
			}
		}
		
		public function determineEmotion():String {
			if (PlayState.Raining) {
				if (PlayState.inHut) {
					return "happy";
				}
				return "sad";
			}
			return "";
		}
	}
}
