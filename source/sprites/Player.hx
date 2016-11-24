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
	public var punchActivate:Bool = false;
	private var timePunch : Int = 0;
	
	public function new(?X:Float=0, ?Y:Float=0) 
	{
		super(X, Y);
		loadGraphic(AssetPaths.Player__png, true, 21, 26);
		animation.add("Run", [0, 1, 2, 1], 10, true);
		animation.add("Jump", [2], 30, false);
		animation.add("Punch", [2,3,2], 20, false);
		animation.play("Run");
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
			flipX = false;
			if (FlxG.keys.pressed.LEFT)
			{
				this.x -= speed;
				animation.play("Run");
				flipX = true;
			}
	 
			if (FlxG.keys.pressed.RIGHT)
			{
				this.x += speed;
				animation.play("Run");
			}
			if (punchActivate){
				timePunch++;
				if (timePunch == 10){
					timePunch = 0;
					punchActivate = false;
					animation.play("Run");
				}
			}
		}
	}	
}