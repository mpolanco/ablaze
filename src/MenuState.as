package
{
	import flash.display.BitmapData;
	import flash.display.Graphics;
	
	import org.flintparticles.common.displayObjects.RadialDot;
	import org.flintparticles.common.displayObjects.Star;
	import org.flintparticles.common.initializers.ImageClass;
	import org.flixel.FlxButton;
	import org.flixel.FlxEmitter;
	import org.flixel.FlxG;
	import org.flixel.FlxParticle;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	
	public class MenuState extends AblazeState
	{
		[Embed (source = "assets/art/Ablaze_Title.png")] public var titleText:Class;
		[Embed(source='assets/art/player.png')]
		public static var ImgPlayer:Class;
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
			var menuText:FlxSprite = new FlxSprite(FlxG.width/2 - 250, 0, titleText);
//			var menuText:FlxSprite = new FlxSprite(FlxG.width/2 - 250, 0, titleText);
//			menuSprite= new OpenningLogo() ;
//			myFlxSprite = new FlxSprite().makeGraphic(menuSprite.width,menuSprite.height);
//			myBitmapData = myFlxSprite.pixels;
//			myBitmapData.draw(menuSprite);
//			add(myFlxSprite);
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
			emitter.particleClass = ImgPlayer;
			trace(emitter.countLiving());
			add(emitter);
		}
		public function startButtonCallback():void {
			FlxG.switchState(new AblazeState);
		}
		public function creditButtonCallback():void {
			FlxG.switchState(new AblazeState);
		}
		public function instructionButtonCallback():void {
			FlxG.switchState(new AblazeState);
		}
		
	}
}