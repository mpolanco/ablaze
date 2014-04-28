package
{		
	import org.flixel.*;
	import Levels.*;

	
	public class MenuState extends FlxState
	{
		public var buttonOffset:FlxPoint = new FlxPoint(10,10);
//		public var menuSprite:OpenningLogo;
//		public var myFlxSprite:FlxSprite;
//		public var myBitmapData:BitmapData;
		public var time:Number;
		public var emitter:FlxEmitter;
		
		override public function create():void
		{
			super.create();
			time = 0;
			var menuText:FlxSprite = new FlxSprite(FlxG.width/2 - 250, 0, Assets.titlePNG);
			menuText.scrollFactor.x = menuText.scrollFactor.y = 0 ; 
			add(menuText);
			var playButton:FlxButton = new FlxButton(FlxG.width/2 - 65, 2*FlxG.height/7.0, "", startButtonCallback);
			playButton.scrollFactor.x = playButton.scrollFactor.y = 0 ;
			add(playButton);
			var instructionButton:FlxButton = new FlxButton(FlxG.width/2 -120, 3*FlxG.height/7.0, "", instructionButtonCallback);
			instructionButton.scrollFactor.x = instructionButton.scrollFactor.y = 0 ; 
			add(instructionButton);
			var creditButton:FlxButton = new FlxButton(FlxG.width/2 - 125, 4*FlxG.height/7.0, "", creditButtonCallback);
			creditButton.scrollFactor.x = creditButton.scrollFactor.y = 0 ; 
			add(creditButton);
			FlxG.mouse.show();
			
			emitter = new FlxEmitter(500,400,500);
			emitter.setXSpeed(-100, 100);
			emitter.setYSpeed(-100, 100);
			
			emitter.start(false, 0, 0.1, 0);
			emitter.on = true;
			emitter.particleClass = Assets.playerPNG;
			trace(emitter.countLiving());
			add(emitter);
		}
		public function startButtonCallback():void {
			FlxG.switchState(new PlayState(BasicLevel));
		}
		public function creditButtonCallback():void {
			//FlxG.switchState(...);
			trace("Credits button pressed");
		}
		public function instructionButtonCallback():void {
			//FlxG.switchState(...);
			trace("Instruction button pressed");
		}
		
	}
}