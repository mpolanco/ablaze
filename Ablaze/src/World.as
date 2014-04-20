
package {	
	import org.flixel.*;
	
	public class World {
		public var player:Player;
		public var screenX:int; // The x coordinate of the upper left corner of the screen.
		public var screenY:int; // The y coordinate of the upper left corner of the screen.
		public var screenWidth:int;
		public var screenHeight:int;
		
		public function World()	{
			this.screenX = 0;
			this.screenY = 0;
			this.screenWidth = 500;
			this.screenHeight = 400;
			
			var playerPhenotypes:Array = new Array();
			this.player = new Player(this.screenWidth / 2, this.screenHeight / 2, 10, 10, playerPhenotypes); 
			this.enemies = new Array();
		}
		
		// Returns if (x, y) are in the screen. Tolerates points xBuffer outside the x range and yBuffer 
		// outside the y range with defaults of xBuffer = 0 and yBuffer = 0.
		public function inScreen(x:int, y:int, xBuffer:int = 0, yBuffer:int = 0):Boolean {
			var inX:Boolean = x >= this.screenX - xBuffer && x < this.screenX + this.screenWidth + xBuffer;
			var inY:Boolean = y >= this.screenY - yBuffer && y < this.screenY + this.screenHeight + yBuffer;
			return inX && inY;
		}
		
		public function update() {
			this.player.update();
			for (var i:int = 0; i < this.enemies.length; i++) {
				this.enemies[i].update();
			}
			FlxG.camera.follow(this.player);
		}
		
		public function display() {
			this.player.display();
			for (var i:int = 0; i < this.enemies.length; i++) {
				this.enemies[i].display();
			}
		}
	}
}
