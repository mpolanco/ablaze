package
{		
	import Levels.*;
	import Levels.Forest.*;
	
	import org.flixel.*;

	
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
			var playButton:FlxButton = new FlxButton(FlxG.width/2 - 120, 2*FlxG.height/7.0, "", playButtonCallback);
			playButton.label = new FlxText(playButton.x, playButton.y,50, "play");
			playButton.scrollFactor.x = playButton.scrollFactor.y = 0 ;
			add(playButton);
			var testButton:FlxButton = new FlxButton(FlxG.width/2 - 120, 3*FlxG.height/7.0, "", testButtonCallback);
			testButton.label = new FlxText(testButton.x, testButton.y,50, "test");
			testButton.scrollFactor.x = testButton.scrollFactor.y = 0 ;
			add(testButton);
			var instructionButton:FlxButton = new FlxButton(FlxG.width/2 -120, 4*FlxG.height/7.0, "", instructionButtonCallback);
			instructionButton.scrollFactor.x = instructionButton.scrollFactor.y = 0 ; 
			instructionButton.label = new FlxText(instructionButton.x, instructionButton.y,50, "instructions");
			add(instructionButton);
			var creditButton:FlxButton = new FlxButton(FlxG.width/2 - 120, 5*FlxG.height/7.0, "", creditButtonCallback);
			creditButton.scrollFactor.x = creditButton.scrollFactor.y = 0 ; 
			creditButton.label = new FlxText(creditButton.x, creditButton.y,50, "credits");			
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
		public function playButtonCallback():void {
			FlxG.switchState(new Forest1(null));
		}
		
		public function testButtonCallback():void {
			FlxG.switchState(new PlayState(TestLevel));
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