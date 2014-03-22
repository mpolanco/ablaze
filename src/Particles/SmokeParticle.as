package Particles
{
	import org.flixel.FlxParticle;
	
	public class SmokeParticle extends FlxParticle
	{
		[Embed(source='res/smoke.png')]
		public static var SmokeImg:Class;
		
		public function SmokeParticle()
		{
			super();
			this.loadGraphic(SmokeImg, true, true, 128, 128);
		}
	}
}