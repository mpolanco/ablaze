package Area
{
	import org.flixel.FlxPoint;

	public class ExpandingRectangle extends RectangleArea
	{
		public var rate:Number;
		public var originX:Number;
		public var originY:Number;
		public var maxWidth:Number;
		public var maxHeight:Number;
		
		public function ExpandingRectangle(X:Number, Y:Number, MaxWidth:Number=0, MaxHeight:Number=0, OriginX:Number=0, OriginY:Number=0, Rate:Number=1)
		{
			super(X, Y, 0, 0); // width and height start at zero to expand
		}
		
		override public function isInsideArea(x:Number, y:Number):Boolean {
			if (width == maxWidth && height == maxHeight) {
				super.isInsideArea(x,y);
			}
			
		}
		
		override public function randomPointInsideArea():FlxPoint{
			if (width == maxWidth && height == maxHeight) {
				return super.randomPointInsideArea();
			}
			
		}
		
		override public function update():void{
			if (width >= maxWidth && height >= maxHeight) {
				width = maxWidth;
				height = maxHeight;
				return;
			}
			this.height += ;
			this.width += ;
		}
	}
}