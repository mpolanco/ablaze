package
{		
	import Levels.*;
	import Levels.Forest.*;
	
	import State.PlayState;
	
	import flash.display.StageDisplayState;
	import flash.events.Event;
	
	import org.flixel.*;
	import org.flixel.system.input.Keyboard;

	
	public class MenuState extends FlxState
	{
		[Embed(source="assets/font/Taibaijan.ttf", fontFamily="Ablaze", embedAsCFF="false")] 	public	var	AblazeFont:String;
		public var buttonOffset:FlxPoint = new FlxPoint(10,10);
		public var menuText:FlxText;
		public var playButton:FlxButton;
		public var testButton:FlxButton;
		public var instructionButton:FlxButton;
		public var creditButton:FlxButton;
//		public var menuSprite:OpenningLogo;
//		public var myFlxSprite:FlxSprite;
//		public var myBitmapData:BitmapData;
		public var time:Number;
		public var emitter:FlxEmitter;
		
		override public function create():void
		{
			super.create();
			time = 0;
			menuText = new FlxText(FlxG.width/4,0,FlxG.width/2, "Ablaze",true);
			menuText.setFormat("Ablaze", 72, 0xffffffff, "center");
			menuText.scrollFactor.x = menuText.scrollFactor.y = 0 ; 
			add(menuText);
			playButton = new FlxButton(FlxG.width/2 - 40, 3*FlxG.height/7.0, "", playButtonCallback);
			playButton.x = FlxG.width / 2 - playButton.width / 2;
			playButton.y = 3*FlxG.height/7.0;
			playButton.label = new FlxText(playButton.x, playButton.y,75, "play");
			playButton.label.setFormat("Ablaze", 10, 0, "center");
			playButton.scrollFactor.x = playButton.scrollFactor.y = 0 ;
			add(playButton);
			
			testButton = new FlxButton(FlxG.width/2 - 40, 4*FlxG.height/7.0, "", testButtonCallback);
			testButton.x = FlxG.width / 2 - testButton.width / 2;
			testButton.y = 4*FlxG.height/7.0;
			testButton.label = new FlxText(testButton.x, testButton.y,75, "test");
			testButton.label.setFormat("Ablaze", 10, 0, "center");
			testButton.scrollFactor.x = testButton.scrollFactor.y = 0 ;
			add(testButton);
			
			instructionButton = new FlxButton(FlxG.width/2 - 40, 5*FlxG.height/7.0, "", instructionButtonCallback);
			instructionButton.x = FlxG.width / 2 - instructionButton.width / 2;
			instructionButton.y = 5*FlxG.height/7.0;
			instructionButton.scrollFactor.x = instructionButton.scrollFactor.y = 0 ; 
			instructionButton.label = new FlxText(instructionButton.x, instructionButton.y,75, "instructions");
			instructionButton.label.setFormat("Ablaze", 10, 0, "center");
			add(instructionButton);
			
			creditButton = new FlxButton(FlxG.width/2 - 40, 6*FlxG.height/7.0, "", creditButtonCallback);
			creditButton.x = FlxG.width / 2 - creditButton.width / 2;
			creditButton.y = 6*FlxG.height/7.0;
			creditButton.scrollFactor.x = creditButton.scrollFactor.y = 0 ; 
			creditButton.label = new FlxText(creditButton.x, creditButton.y,75, "credits");
			creditButton.label.setFormat("Ablaze", 10, 0 , "center");
			add(creditButton);
			FlxG.mouse.show();
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
		override public function update():void {
			super.update();
			if (FlxG.keys.justPressed("T")) {
				toggle_fullscreen();
			}
		} 
		
		// This is called when the user clicks the button.
		// By default, it will go to fullscreen if windowed, and windowed if fullscreen
		// Use the Force parameter to force it to go to a specific mode
		private function toggle_fullscreen(ForceDisplayState:String=null):void {
			
			// 1. Change the size of the Flash window to fullscreen/windowed
			//    This is easily done by checking stage.displayState and then setting it accordingly
			if (ForceDisplayState) {
				FlxG.stage.displayState = ForceDisplayState;
			} else {
				if (FlxG.stage.displayState == StageDisplayState.NORMAL) {
					FlxG.stage.displayState = StageDisplayState.FULL_SCREEN;
				} else {
					FlxG.stage.displayState = StageDisplayState.NORMAL;
				}
			}
			
			// The next function contains steps 2-4
			window_resized();
		}
		
		// This is called every time the window is resized
		// It's a separate function than toggle_fullscreen because we want to call it when the window
		// size changed even if the user didn't click the fullscreen button (eg by pressing escape to exit fullscreen mode)
		private function window_resized(e:Event = null):void {
			
			// 2. Change the size of the Flixel game window
			//    We already changed the size of the Flash window, so now we need to update Flixel.
			//    Just update the FlxG dimensions to match the new stage dimensions from step 1
			FlxG.width = FlxG.stage.stageWidth / FlxCamera.defaultZoom;
			FlxG.height = FlxG.stage.stageHeight / FlxCamera.defaultZoom;
			
			// 3. Change the size of the Flixel camera
			//    Lastly, update the Flixel camera to match the new dimensions from the previous step
			//    This is so that the camera can see all of the freshly resized dimensions
			FlxG.resetCameras(new FlxCamera(0, 0, FlxG.width, FlxG.height));
			
			// 4. Optionally, depening on your game, you may need to update couple more things:
			//    - Reposition / resize things such as the Hud to match the new screen dimensions
			//    - Camera bounds to allow the camera to travel everywhere within the resized dimensions
			//    - World bounds to allow everything to collide within the resized dimensions
			//    - For more information on camera/world bounds/hud positioning check out our other tutorial at
			//              http://www.funstormgames.com/blog/2011/10/flixel-setting-up-game-dimensions-swf-camera-level-hud-mouse/
			//    Anyways, we're just going to update the fullscreen button and dimensions text
			menuText.width = FlxG.width;
			menuText.x = FlxG.width / 2 - menuText.width/4;
			menuText.y = 0;
			
			playButton.x = FlxG.width / 2 - playButton.width / 2;
			playButton.y = 3*FlxG.height/7.0;
			testButton.x = FlxG.width / 2 - testButton.width / 2;
			testButton.y = 4*FlxG.height/7.0;
			instructionButton.x = FlxG.width / 2 - instructionButton.width / 2;
			instructionButton.y = 5*FlxG.height/7.0;
			creditButton.x = FlxG.width / 2 - creditButton.width / 2;
			creditButton.y = 6*FlxG.height/7.0;
//			textDimensions.width = FlxG.width;
//			textDimensions.text = "Current resolution: " + FlxG.width + "*" + FlxG.height;
			
		}
		
	}
}