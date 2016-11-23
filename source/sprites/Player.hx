package sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxState;
import flixel.FlxG;
import flixel.system.FlxSound;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.FlxObject;

class Player extends FlxSprite
{
	public var speed:Int = Reg.playerSpeed;
	
	public function new(?X:Float=0, ?Y:Float=0) 
	{
		super(X, Y);
		makeGraphic(20, 20, 0xFFFFFFFF);
		acceleration.y = 700;
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		Movement();
	}
	
	public function Movement():Void 
	{
		if (this.alive)
		{
			if (FlxG.keys.pressed.LEFT)
			{
				this.x -= speed;
			}
	 
			if (FlxG.keys.pressed.RIGHT)
			{
				this.x += speed;
			}
	 
			if (FlxG.keys.pressed.DOWN)
			{
				this.y += speed;
			}
		}
	}	
}