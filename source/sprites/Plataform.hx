package sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.math.FlxRandom;

/**
 * ...
 * @author ...
 */
class Plataform extends FlxSprite
{
	private var r : FlxRandom;
	
	public function new(num :Int,?X:Float=0, ?Y:Float=0) 
	{
		super(X, Y);
		var xlar : Int = 0;
		var yalt : Int = 0;
		r = new FlxRandom();
		switch(num)
		{
			case 0:
				this.y = 220;
			case 1:
				this.y = 140;
			case 2:
				this.y = 60;
		}
		switch(r.int(1, 3))
		{
			case 1:
				xlar = 120;
				this.x += 60;
			case 2:
				xlar = 80;
				this.x += 40;
			case 3:
				xlar = 60;
				this.x += 30;
		}
		makeGraphic(xlar, 20, 0xFF448801);
		immovable = true;
	}
	
}