package sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class Player2 extends FlxSprite 
{

	public var secue : Bool = false;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.Player2__png, true, 17, 26);
		animation.add("Run", [0, 1, 2, 1], 10, true);
		animation.play("Run");		
	}
	
}