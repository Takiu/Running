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
				this.y = 200;
			case 1:
				this.y = 130;
		}
		switch(r.int(1, 3))
		{
			case 1:
				xlar = 110;
			case 2:
				xlar = 80;
				this.x += 15;
			case 3:
				xlar = 40;
				this.x += 25;
		}
		makeGraphic(xlar, 10, 0xFF448801);
		immovable = true;
	}
	
}