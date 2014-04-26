package Scenes
{
	import Cinematic.Backdrop;
	import Cinematic.Background;
	import Cinematic.Foreground;
	import Cinematic.Layer;
	import Cinematic.Scene;
	
	public class Prototype extends Scene
	{
		public function Prototype()
		{
			var playerLayer:Layer = new Layer(Assets.prototypeMapCSV, Assets.tilesPNG, 16, 16);
			var platformsLayer:Layer = new Layer(Assets.prototypeMapCSV, Assets.tilesPNG, 16, 16);
			var foreground:Foreground = new Foreground(playerLayer, platformsLayer);
			var backdrops:Array = new Array();
			var backdropLayer:Layer = new Layer(Assets.prototypeBackgroundCSV, Assets.backgroundPNG, 192, 336, 1);
			backdrops.push(new Backdrop(backdropLayer, 0.9));
			var background:Background = new Background(backdrops);
			super(foreground, background);
		}
	}
}