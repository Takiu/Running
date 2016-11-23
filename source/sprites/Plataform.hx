package sprites;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.math.FlxRandom;
import flixel.FlxG;

class Plataform extends FlxSprite
{
	private var r : FlxRandom;
	public var secBase : FlxSprite;

	public function new(num :Int,?X:Float=0, ?Y:Float=0) 
	{
		super(X, Y);
		r = new FlxRandom();	
		secBase = new FlxSprite();
		switch(r.int(1, 3))
		{
			case 1:
				switch(num)
				{
					case 1:
						this.y = 200;
						loadGraphic(AssetPaths.PlatLargBase__png, false, 110, 40);
					case 0:
						this.y = 130;
						loadGraphic(AssetPaths.PlatLargo__png, false, 110, 10);
						secBase.loadGraphic(AssetPaths.FondoPlatLarg__png, false, 110, 70);
						secBase.x = this.x;
						secBase.y = this.y - 7;
				}
			case 2:
				this.x += 15;
				switch(num)
				{
					case 1:
						this.y = 200;
						loadGraphic(AssetPaths.PlatMedBase__png, false, 80, 40);
					case 0:
						this.y = 130;
						loadGraphic(AssetPaths.PlatMed__png, false, 80, 10);
						secBase.loadGraphic(AssetPaths.FondoPlatMed__png, false, 80, 70);
						secBase.x = this.x;
						secBase.y = this.y - 7;
				}
			case 3:
				this.x += 30;
				switch(num)
				{
					case 1:
						this.y = 200;
						loadGraphic(AssetPaths.PlatChicBase__png, false, 60, 40);
					case 0:
						this.y = 130;
						loadGraphic(AssetPaths.PlatChic__png, false, 60, 10);
						secBase.loadGraphic(AssetPaths.FondoPlatChic__png, false, 60, 70);
						secBase.x = this.x;
						secBase.y = this.y - 7;
				}
		}		
		immovable = true;
	}
	
}