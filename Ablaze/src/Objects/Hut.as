package Objects
{
	import Area.RectangleArea;
	import Area.UpperHalfCircleArea;
	
	import ParticleEmitters.FireEmitter;
	import ParticleEmitters.SmokeEmitter;
	
	import State.PlayState;
	
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import org.flixel.FlxSprite;
	import org.osmf.events.TimeEvent;
	
	public class Hut extends FlxSprite
	{
		public var eyes:FlxSprite;
		public var smokeEmitter:SmokeEmitter;
		public var fireEmitter:FireEmitter;
		public var triggerArea:RectangleArea;
		public var burnArea:UpperHalfCircleArea;
		private var playerInside:Boolean;
		private var shelterTimer:Timer;
		private var burnTimer:Timer;
		public var fadeRate:Number = 1.0/30.0;
		
		[Embed(source = '../assets/art/hut_small.png')] private static var hutPNG:Class;
		
		public function Hut(X:Number=0, Y:Number=0, SimpleGraphic:Class=null)
		{
			super(X, Y, SimpleGraphic);
			this.loadGraphic(hutPNG, false, false, 150, 80, false);
			this.burnArea = new UpperHalfCircleArea(X + 75, Y + 75, 75);
			this.triggerArea = new RectangleArea(X, Y, 150, 80, false);
			this.fireEmitter = new FireEmitter(this.burnArea, this.x + 75, this.y + 75, 150, .5, .5);
			this.fireEmitter.active = false;
		}
		
		override public function update():void {
			trace("update state:" +PlayState.state +"player:" +PlayState.state.player);
			var playerX:Number = PlayState.state.player.x;
			var playerY:Number = PlayState.state.player.y;
			if (this.triggerArea.isInsideArea(playerX,playerY) && !this.playerInside) {
				this.playerInside = true;
				startShelterTimer();
				trace("inside");
			}
			if (!this.triggerArea.isInsideArea(playerX,playerY) && this.playerInside) {
				this.playerInside = false;
				this.shelterTimer.stop();
				this.shelterTimer.reset();
			}
		}
		
		public function startShelterTimer():void {
			shelterTimer = new Timer(5000, 1);
			shelterTimer.addEventListener(TimerEvent.TIMER_COMPLETE, burnUp);
			shelterTimer.start();
		}
		
		public function burnUp(e:TimerEvent):void {
			burnTimer = new Timer(40, 49);
			this.fireEmitter.active = true;
			burnTimer.addEventListener(TimerEvent.TIMER, burnRateHelper);
			burnTimer.addEventListener(TimerEvent.TIMER_COMPLETE, fadeOut);
			burnTimer.start();
		}
		
		private function burnRateHelper(e:TimerEvent):void {
			this.fireEmitter.frequency -= 0.01;
			trace("increasing burn frequency");
			trace(this.fireEmitter.frequency);
		}
		
		public function fadeOut(e:TimerEvent):void {
			var foTimer:Timer = new Timer(40, 30);
			foTimer.addEventListener(TimerEvent.TIMER, fadeOutHelper);
			foTimer.addEventListener(TimerEvent.TIMER_COMPLETE, killHelper);
			foTimer.start();
		}
		
		private function fadeOutHelper(e:TimerEvent):void {
			this.alpha -= fadeRate;
		}
		
		private function killHelper(e:TimerEvent):void {
			this.fireEmitter.frequency = 0;
			this.kill();
		}
		
		override public function kill():void {
			super.kill();
			trace("HUT was killed");
		}
	}
}