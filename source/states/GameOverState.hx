package states;

import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import states.PlayState;
import flixel.system.FlxSound;

class GameOverState extends FlxState
{	
	
	private var gameOver:FlxText;	
	private var scoreTxt:FlxText;
	private var highScoreTxt:FlxText;
	private var _score:Int;
	private var _victory:Bool;
	private var replayText:FlxText;
	private var optionPointer:FlxSprite;
	private var image:FlxSprite;
	
	public function new(victory:Bool) 
	{
		_victory = victory;
		super();
	}
	
	override public function create():Void
	{
		super.create();

		gameOver = new FlxText(20, 50, 0, null, 20);
		
		image = new FlxSprite();
		
		if (_victory)
		{
			gameOver.text = "¡¡WINNER!!";
			image.makeGraphic(32, 32, 0xFFFFFFFF);
		}
		else
		{
			gameOver.text = "GAME OVER";
			image.makeGraphic(32, 32, 0xFFFFFFFF);
		}
		gameOver.alignment = CENTER;
		gameOver.screenCenter(X);
		gameOver.color = 0xFFd8d8d8;
		
		add(gameOver);
		
		image.x = (FlxG.width / 2) - image.width / 2 ;
		image.y = 120;
		add(image);
		
		scoreTxt = new FlxText(0, 80, 0, "Score : " + Reg.score, 12);
		scoreTxt.alignment = CENTER;
		scoreTxt.screenCenter(X);
		scoreTxt.color = 0xFFd8d8d8;
		add(scoreTxt);
		
		highScoreTxt = new FlxText(0, 95, 0, "Highscore : " + Reg.highScore , 12);
		highScoreTxt.alignment = CENTER;
		highScoreTxt.screenCenter(X);
		highScoreTxt.color = 0xFFd8d8d8;
		add(highScoreTxt);
		
		replayText = new FlxText(0, 0, "REPLAY");
		replayText.x = (FlxG.width / 2) - (replayText.width / 2);
		replayText.y = FlxG.height - replayText.height - 10;
		add(replayText);
		
		optionPointer = new FlxSprite();
		optionPointer.makeGraphic(30,10,0xFFF7FE2E);
		optionPointer.x = replayText.x - optionPointer.width - 5;
		optionPointer.y = replayText.y - 1;
		add(optionPointer);
	}
	
	override public function update(elapsed:Float):Void
	{
		if (FlxG.keys.justPressed.ENTER)
		{
			Restart();
		}
		super.update(elapsed);
	}
	
	private function Restart():Void
	{
		Reg.score = 0;
		FlxG.switchState(new PlayState());
	}
}