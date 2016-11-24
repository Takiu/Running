package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.tile.FlxTilemap;
import flixel.util.FlxColor;
import flixel.FlxObject;
import flixel.system.FlxSound;

class MenuState extends FlxState
{
	private var NameTxt:FlxText;
	private var instructionsTxt:FlxText;
	private var playText:FlxText;
	private var optionPointer:FlxSprite;
	private var image:FlxSprite;
	private var sound: FlxSound;
	
	override public function create():Void
	{
		FlxG.camera.fade(FlxColor.BLACK, 1, true);
		super.create();
		sound = FlxG.sound.load(AssetPaths.Intro__wav, 0.5, true);
		sound.play();
		NameTxt = new FlxText(20, 50, 0, "CityRun", 40);
		NameTxt.alignment = CENTER;
		NameTxt.screenCenter(X);
		NameTxt.color = 0xFFd8d8d8;
		add(NameTxt);
		
		instructionsTxt = new FlxText(0, 150, 0, "Move: Arrow keys\n Attack: X", 8);
		instructionsTxt.alignment = CENTER;
		instructionsTxt.screenCenter(X);
		add(instructionsTxt);
	   
		playText = new FlxText(0, 0, "PLAY");
		playText.x = (FlxG.width / 2) - (playText.width / 2);
		playText.y = FlxG.height - playText.height - 20;
		add(playText);
		
		image = new FlxSprite();
		image.loadGraphic(AssetPaths.P2A__png, true, 18, 26);
		image.animation.add("ani", [0, 1, 0, 2], 10, true);
		image.animation.play("ani");
		image.x = playText.x + playText.width + 5;
		image.y = playText.y - 1;
		add(image);
		
		optionPointer = new FlxSprite();
		optionPointer.loadGraphic(AssetPaths.P1A__png, true, 19, 27);
		optionPointer.animation.add("ani", [0, 1, 0, 2], 10, true);
		optionPointer.animation.play("ani");
		optionPointer.x = playText.x - optionPointer.width - 5;
		optionPointer.y = playText.y - 1;
		add(optionPointer);
	}

	override public function update(elapsed:Float):Void
	{
		if (FlxG.keys.justPressed.ENTER)
		{
			Start();
		}
		super.update(elapsed);
	}
	
	public function Start():Void
	{
		remove(NameTxt);
		remove(instructionsTxt);
		FlxG.switchState(new PlayState());
	}
}
