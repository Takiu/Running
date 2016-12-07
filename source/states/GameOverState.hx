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
	private var sound : FlxSound;
	
	private var m1 : FlxSprite;
	private var m2 : FlxSprite;
	private var m3: FlxSprite;
	private var m4 : FlxSprite;
	private var p2a : FlxSprite;
	
	public function new(victory:Bool) 
	{
		_victory = victory;
		super();
	}
	
	override public function create():Void
	{
		super.create();

		gameOver = new FlxText(20, 50, 0, null, 20);		
		
		replayText = new FlxText(0, 0, 0, "REPLAY", 8, true);
		replayText.x = (FlxG.width / 2) - (replayText.width / 2);
		replayText.y = FlxG.height - replayText.height - 10;
		add(replayText);
		
		if (_victory)
		{
			sound = FlxG.sound.load(AssetPaths.Winner__ogg, 1, true);
			sound.play();
			gameOver.text = "¡¡WINNER!!";
			m1 = new FlxSprite();
			m1.loadGraphic(AssetPaths.Player__png, true, 21, 26);
			m1.animation.add("ani", [0, 1, 2], 5, true, true);
			m1.animation.play("ani");
			m1.x = (FlxG.width / 2)-10;
			m1.y = (FlxG.height / 2) - m1.height / 2 + 20;
			add(m1);
			m2 = new FlxSprite();
			m2.loadGraphic(AssetPaths.Player2__png, true, 17, 26);
			m2.animation.add("ani",[0,1,2],5,true);
			m2.animation.play("ani");
			m2.x = (FlxG.width / 2) - m2.width - 8;
			m2.y = (FlxG.height / 2) - m2.height / 2 + 20;
			add(m2);
			m3 = new FlxSprite();
			m3.loadGraphic(AssetPaths.Heart__png, true, 17, 16);
			m3.animation.add("ani", [0, 1, 2], 3, true);
			m3.animation.play("ani");
			m3.x = m1.x - m3.width / 2 + 3;
			m3.y = m1.y - m3.height;
			add(m3);
			optionPointer = new FlxSprite();
			optionPointer.loadGraphic(AssetPaths.Malos__png, true, 18, 25);
			optionPointer.animation.add("ani", [0, 1, 3, 2], 2, true);
			optionPointer.animation.play("ani");
			optionPointer.x = replayText.x - optionPointer.width - 5;
			optionPointer.y = replayText.y - 4;
			add(optionPointer);
		}
		else
		{
			sound = FlxG.sound.load(AssetPaths.Ending__ogg, 1, true);
			sound.play();
			gameOver.text = "GAME OVER";
			m1 = new FlxSprite();
			m1.loadGraphic(AssetPaths.Boss__png, false, 17, 28);
			m1.x = (FlxG.width / 2) - m1.width / 2 ;
			m1.y = (FlxG.height / 2) - m1.height / 2 ;
			add(m1);
			p2a = new FlxSprite();
			p2a.loadGraphic(AssetPaths.P2A__png, true, 18, 26);
			p2a.animation.add("ani", [0, 1, 0, 2], 2, true);
			p2a.animation.play("ani");
			p2a.x = m1.x;
			p2a.y = m1.y + m1.height + 2;
			add(p2a);
			m2 = new FlxSprite();
			m2.loadGraphic(AssetPaths.Malos__png, true, 18, 25);
			m2.animation.add("ani", [1, 0, 2, 3], 5, true);
			m2.animation.play("ani");
			m2.x = m1.x + m1.width + 2;
			m2.y = m1.y + m1.height + 2;
			add(m2);
			m3 = new FlxSprite();
			m3.loadGraphic(AssetPaths.Malos__png, true, 18, 25);
			m3.animation.add("ani", [2, 0, 1, 3], 5, true);
			m3.animation.play("ani");
			m3.x = m1.x - m3.width - 2;
			m3.y = m1.y + m1.height + 2;
			add(m3);
			m4 = new FlxSprite();
			m4.loadGraphic(AssetPaths.Malos__png, true, 18, 25);
			m4.animation.add("ani", [0,1,2,3], 5, true);
			m4.animation.play("ani");
			m4.x = m1.x;
			m4.y = m1.y + m1.height + p2a.height + 4;
			add(m4);
			
			optionPointer = new FlxSprite();
			optionPointer.loadGraphic(AssetPaths.P1A__png, true, 19, 27);
			optionPointer.animation.add("ani", [0, 1, 0, 2], 2, true);
			optionPointer.animation.play("ani");
			optionPointer.x = replayText.x - optionPointer.width - 5;
			optionPointer.y = replayText.y - 4;
			add(optionPointer);
		}
		gameOver.alignment = CENTER;
		gameOver.screenCenter(X);
		gameOver.color = 0xFFd8d8d8;
		
		add(gameOver);		
		
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