package sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author Kasai Takunori
 */
class Ene1 extends FlxSprite
{	
	public var enSalto : Bool = false;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{		
		super(X, Y, SimpleGraphic);	
		makeGraphic(20, 20, 0xFFFF0000);
		velocity.x = -30;
		acceleration.y = 700;
	}
	
}