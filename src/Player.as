
package {	
	public class Player {
		public var x:int;
		public var y:int;
		public var health:int;
		public var maxHealth:int;
		public var phenotypes:Array;
		// Legal values of mode include:
		// "attacking", "running", "wandering". Change this.update() if this is changed. 
		public var mode:String;
		
		public function Player(x:int, y:int, health:int, maxHealth:int, phenotypes:Array) {
			this.x = x;
			this.y = y;
			this.health = health;
			this.maxHealth = maxHealth;
			this.phenotypes = phenotypes;
		}
		
		// This method is called often to update the state of the creature.
		public function update():void {
			switch (this.mode) {
				case "attacking":
					break;
				case "running":
					break;
				case "wandering":
					break;
				default:
					break;
			}
		}
		
		
		public function alive():Boolean {
			return this.health > 0;
		}
	}
}
