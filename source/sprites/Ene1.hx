package sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.math.FlxRandom;

class Ene1 extends FlxSprite
{	
	public var enSalto : Bool = false;
	private var r : FlxRandom;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{		
		super(X, Y, SimpleGraphic);	
		makeGraphic(20, 20, 0xFFFF0000);
		velocity.x = -30;
		acceleration.y = 700;
		r = new FlxRandom();
		if (r.int(1, 2) == 1){
			this.y = 110;
		}
		else
		{
			this.y = 180;
		}
	}
	
}