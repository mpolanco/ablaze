package Objects
{
	import Area.DrapeArea;
	import Area.PointArea;
	
	import ParticleEmitters.FireEmitter;
	
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import State.PlayState;
	
	public class Drape extends FlxSprite
	{
		[Embed(source="../assets/art/drape.png")]
		public static var DrapeImg:Class;
		
		private var onFire:Boolean;
		public var fireEmitter:FireEmitter;
		
		public function Drape(X:Number=0, Y:Number=0, SimpleGraphic:Class=null)
		{
			this.loadGraphic(DrapeImg, true,true, 675/8, 525/8);
			this.x = X;
			this.y = Y;
			this.maxVelocity.x = 0;
			this.maxVelocity.y = 0;
			this.acceleration.y = 0;
			this.onFire = false;
			this.fireEmitter = new FireEmitter(new DrapeArea(this.x,this.y), this.x, this.y, 100, 0.01);
//			this.fireEmitter.active = false;
		}
		override public function update():void
		{
			super.update();
			this.fireEmitter.x = this.x;
			this.fireEmitter.y = this.y;
			
			if (FlxG.collide(this, PlayState.state.player))
			{
				trace("player hit drape");
				this.onFire = true;
			}
			this.fireEmitter.active = this.onFire;
		}
	}
}