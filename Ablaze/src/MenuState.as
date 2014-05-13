package
{		
	import Levels.*;
	import Levels.Forest.*;
	
	import State.PlayState;
	
	import org.flixel.*;

	
	public class MenuState extends FlxState
	{
		[Embed(source="assets/font/Taibaijan.ttf", fontFamily="Ablaze", embedAsCFF="false")] 	public	var	AblazeFont:String;
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
//			var menuText:FlxSprite = new FlxSprite(FlxG.width/2, 0, Assets.titlePNG);
			var menuText:FlxText = new FlxText(FlxG.width/2 - 150,0,300, "Ablaze",true);
			menuText.setFormat("Ablaze", 72, 0xffffffff, "center");
			menuText.scrollFactor.x = menuText.scrollFactor.y = 0 ; 
			add(menuText);
			var playButton:FlxButton = new FlxButton(FlxG.width/2 - 40, 3*FlxG.height/7.0, "", playButtonCallback);
			playButton.label = new FlxText(playButton.x, playButton.y,75, "play");
			playButton.label.setFormat("Ablaze", 10, 0, "center");
			playButton.scrollFactor.x = playButton.scrollFactor.y = 0 ;
			add(playButton);
			var testButton:FlxButton = new FlxButton(FlxG.width/2 - 40, 4*FlxG.height/7.0, "", testButtonCallback);
			testButton.label = new FlxText(testButton.x, testButton.y,75, "test");
			testButton.label.setFormat("Ablaze", 10, 0, "center");
			testButton.scrollFactor.x = testButton.scrollFactor.y = 0 ;
			add(testButton);
			var instructionButton:FlxButton = new FlxButton(FlxG.width/2 - 40, 5*FlxG.height/7.0, "", instructionButtonCallback);
			instructionButton.scrollFactor.x = instructionButton.scrollFactor.y = 0 ; 
			instructionButton.label = new FlxText(instructionButton.x, instructionButton.y,75, "instructions");
			instructionButton.label.setFormat("Ablaze", 10, 0, "center");
			add(instructionButton);
			var creditButton:FlxButton = new FlxButton(FlxG.width/2 - 40, 6*FlxG.height/7.0, "", creditButtonCallback);
			creditButton.scrollFactor.x = creditButton.scrollFactor.y = 0 ; 
			creditButton.label = new FlxText(creditButton.x, creditButton.y,75, "credits");
			creditButton.label.setFormat("Ablaze", 10, 0 , "center");
			add(creditButton);
			FlxG.mouse.show();
		}
		public function playButtonCallback():void {
			FlxG.switchState(new Forest3(null));
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