package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.FlxObject;
import flixel.math.FlxPoint;
import flixel.util.FlxTimer;
import flixel.system.FlxSound;
import sprites.Player;
import sprites.Plataform;

class PlayState extends FlxState
{
	private var player:Player;
	public var screenPositionX:Float = 0;
	public var screenSpeed:Float = 1;
	public var scroll:Bool = true;
	private var scoreText:FlxText;
	private var highScoreText:FlxText;
	private var turretFireTimer:FlxTimer;
	private var themeSong:FlxSound;
	private var powerUpSound:FlxSound;
	private var plataforms:FlxTypedGroup<Plataform>;
	
	override public function create():Void
	{
		super.create();
		//themeSong = FlxG.sound.load(AssetPaths.ThemeSong__wav, 1, true);
		//themeSong.play();
		drawEntities ("player");
		FlxG.camera.setScrollBounds(0, 2560, 0, 240);
		FlxG.camera.scroll = new FlxPoint(player.x,player.y);
		scroll = true;				
		scoreText = new FlxText(80, Reg.ScreenHeight - 20, "Score : " + Reg.score);
		add(scoreText);
		highScoreText = new FlxText(170, Reg.ScreenHeight - 20, "HighScore : " + Reg.highScore);
		add(highScoreText);
		
		Reg.playerCoords = new FlxPoint(player.x, player.y);
		
		plataforms = new FlxTypedGroup<Plataform>();		
		FlxG.watch.add(player, "x");
		var plat:Plataform;			
		plat = new Plataform(1);				
		plat.makeGraphic(300, 40, 0xFFFF4502);
		plat.x = 0;
		plat.y = 200;
		plataforms.add(plat);
		add(plataforms);	
		FlxG.watch.add(player,"x");
		
	}
	
	var timePlat : Int = 140;
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		FlxG.collide(plataforms, player);
		
		if (player.alive)
		{
			CameraMovement();
			PlayerMovementInCameraBounds();		
	 
			if (player.isTouching(FlxObject.FLOOR))
			{				
				player.velocity.y = 0;
				if (FlxG.keys.pressed.UP)
				{
					player.velocity.y = -250;
				}
			}
			
		}
		if (timePlat >= 100)
		{
			drawEntities("plataform");
			timePlat = 0;			
		}
		for (i in plataforms)
		{
			if (!InCameraBounds(i))
			{
				plataforms.remove(i);
				i.destroy();
			}
		}
		
		timePlat++;
		
		if (FlxG.keys.justPressed.R)
			FlxG.resetState();
	}
	
	private function ActivateEnemies()
	{
		//Agregar enemigos aca
	}
	
	private function GameOver(victory:Bool):Void
	{
		FlxG.switchState(new GameOverState(victory));
	}
	
	private function RestartLevel():Void
	{
		FlxG.switchState(new PlayState());
	}
	
	public function UpdateScore():Void
	{
		scoreText.text = "Score : " + Reg.score;
		if (Reg.score > Reg.highScore)
		{
			Reg.highScore = Reg.score;
			UpdateHighScore();
		}
	}
	
	public function UpdateHighScore():Void
	{
		highScoreText.text = "HighScore : " + Reg.highScore;
	}
	
	private function Collisions():Void
	{	
		//Aca van las colisiones
	}
	
	private function CollsionHandler(Sprite1:FlxObject, Sprite2:FlxObject):Bool
	{
		//La funcion que hace dependiendo de los sprites
		return false;
	}
	
	private function PllayerStageCollision():Void
	{
		//Cambiarlo por el piso y que pierda si cae o le sacan a la minita
		/*
		if (player.isTouching(FlxObject.ANY))
		{
			if (Reg.playerLives > 0)
			{
				Reg.playerLives--;
				RestartLevel();
			}
			else
			{
				GameOver(false);
			}
		}*/
	}
	
	private function PlayerMovementInCameraBounds():Void
	{
		var newScroll = FlxG.camera.scroll;

		if (player.x > newScroll.x + Reg.ScreenWidth - player.width)
		{
			player.x = newScroll.x + Reg.ScreenWidth - player.width;	
		}
		if (player.x < newScroll.x)
		{
			player.x = newScroll.x;
		}
		if (player.y > newScroll.y + Reg.ScreenHeight - player.height)
		{
			player.y = newScroll.y + Reg.ScreenHeight - player.height;	
		}
		if (player.y < newScroll.y)
		{
			player.y = newScroll.y;
		}
	}
	
	private function CameraMovement():Void
	{
		var newScroll = FlxG.camera.scroll;
		if (scroll){
			if (newScroll.x + 256 >= 2560)
			{
				//Llego al final
			}
			else
			{
				newScroll.x += screenSpeed;
				FlxG.camera.scroll = newScroll;
				player.x += screenSpeed;
				scoreText.x += screenSpeed;
				highScoreText.x += screenSpeed;
			}			
		}
	}
	
	private function EnemiesInCamera()
	{
		/*for (enemy in enemiesType1)
		{
			if (enemy.alive && !InCameraBounds(enemy))
			{
				enemiesType1.remove(enemy);
				enemy.kill();
			}
		}*/
	}
	
	private function InCameraBounds(sprite:FlxSprite):Bool
	{
		//Revisa si esta dentro de la camara
		var newScroll = FlxG.camera.scroll;

		if (sprite.x >newScroll.x + 400)
		{
			return false;
		}
		if (sprite.x < newScroll.x -400)
		{
			return false;
		}
		if (sprite.y + sprite.height > newScroll.y + Reg.ScreenHeight)
		{
			return false;
		}
		if (sprite.y < newScroll.y)
		{
			return false;
		}
		return true;
	}
	
	private function drawEntities( entityName:String):Void
	{
		if (entityName == "player")
		{
			var X:Float = 0;
			var Y:Float = 180;
			
			player = new Player(X, Y);
			add(player);
		}
		
		if (entityName == "plataform")
		{		
			var newScroll = FlxG.camera.scroll;
			
			var plat:Plataform;
			for(i in 0...3){								
				plat = new Plataform(i,newScroll.x+256);				
				plataforms.add(plat);
			}
		}
		
		/*
		if (entityName == "enemy1")
		{
			var X:Float = Std.parseFloat(entityData.get("x"));
			var Y:Float = Std.parseFloat(entityData.get("y"));
			
			var enemy:Ene1;
			enemy = new Ene1(X, Y);
			enemy.kill();
			enemiesType1.add(enemy);
		}
		*/
	}
}
