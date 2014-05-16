package Text
{
	import Area.AreaImpl;
	
	import State.PlayState;
	
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import org.flixel.FlxG;
	import org.flixel.FlxText;
	
	public class AblazeText extends FlxText implements Fadeable
	{
		[Embed(source="assets/font/CFAloneontheEarthDEMO-Regul.ttf", fontFamily="Alone", embedAsCFF="false")] 	public	var	FontAlone:String;
		[Embed(source="assets/font/Taibaijan.ttf", fontFamily="Ablaze", embedAsCFF="false")] 	public	var	AblazeFont:String;
		public var bounds:AreaImpl;
		public var playerInside:Boolean;
		public var fadeRate:Number = 1.0/30.0;
		
		public function AblazeText(X:Number, Y:Number, Width:uint, Bounds:AreaImpl, Text:String=null, EmbeddedFont:Boolean=true)
		{
			super(X, Y, Width, Text, EmbeddedFont);
			this.setFormat("Ablaze", 20, 0xffffffff, "center");
			this.bounds = Bounds;
			this.playerInside = false;
			this.alpha = 0;
		}
		
		override public function update():void {
			var playerX:Number = PlayState.state.player.x;
			var playerY:Number = PlayState.state.player.y;
			if (this.bounds.isInsideArea(playerX,playerY) && !this.playerInside) {
				this.playerInside = true;
				fadeIn();
			}
			if (!this.bounds.isInsideArea(playerX,playerY) && this.playerInside) {
				this.playerInside = false;
				fadeOut();
			}
		}
		
		public function fadeIn():void {
			var fiTimer:Timer = new Timer(40, 30);
			fiTimer.addEventListener(TimerEvent.TIMER, fadeInHelper);
			fiTimer.start();
		}
		
		public function fadeOut():void {
			var foTimer:Timer = new Timer(40, 30);
			foTimer.addEventListener(TimerEvent.TIMER, fadeOutHelper);
			foTimer.addEventListener(TimerEvent.TIMER_COMPLETE, dieText);
			foTimer.start();
		}
		
		public function fadeOutHelper(e:TimerEvent):void {
			this.alpha -= fadeRate;
		}
		
		public function fadeInHelper(e:TimerEvent):void {
			this.alpha += fadeRate;
		}
		
		override public function kill():void {
			super.kill();
		}
			
		private function dieText(e:TimerEvent):void 
		{
//			dieTimer.removeEventListener(TimerEvent.TIMER, fadeText);
//			dieTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, dieText);	
//			FlxG.state.defaultGroup.remove(this);
		}
	}
}