package sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxState;
import flixel.FlxG;
import flixel.system.FlxSound;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.FlxObject;
/**
 * ...
 * @author Maximiliano Viñas Craba
 */
class Player extends FlxSprite
{
	public var speed:Int = Reg.playerSpeed;
	public var bullets:FlxTypedGroup<Bullet>;
	private var shootInterval:Int = 0;
	
	public function new(?X:Float=0, ?Y:Float=0) 
	{
		super(X, Y);
		loadGraphic(AssetPaths.Nave__png, false, 16, 16);
		acceleration.y = 400;
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
			/*
			if (FlxG.keys.justPressed.Z)
			{
				if (shootInterval > 30)
				{
					Shoot();
					shootInterval = 0;
				}
			}
			*/
		}
	}	
}