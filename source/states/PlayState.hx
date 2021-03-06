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
import sprites.Player2;
import sprites.Plataform;
import sprites.Ene1;

class PlayState extends FlxState
{
	private var player:Player;
	public var screenPositionX:Float = 0;
	public var screenSpeed:Float = 1;
	public var scroll:Bool = true;
	private var scoreText:FlxText;
	private var highScoreText:FlxText;
	private var themeSong:FlxSound;
	private var plataforms:FlxTypedGroup<Plataform>;
	private var plataFondo:FlxTypedGroup<FlxSprite>;
	private var ene: FlxTypedGroup<Ene1>;
	private var dific : Int;
	private var play2 : Player2;	
	private var eneSec: Ene1;
	private var eneSpawn : Bool = true;
	private var xRecorrido : Float = 0;
	private var fondo : FlxSprite;
	private var jumpSound : FlxSound;
	private var hitSound : FlxSound;
	private var caidaSound : FlxSound;
	private var golpeSound : FlxSound;
	
	override public function create():Void
	{
		super.create();
		themeSong = FlxG.sound.load(AssetPaths.MuteCity__ogg, 1, true);
		themeSong.play();
		hitSound = FlxG.sound.load(AssetPaths.Hit__ogg, 0.8, false);
		jumpSound = FlxG.sound.load(AssetPaths.Jump__ogg, 0.8, false);
		caidaSound = FlxG.sound.load(AssetPaths.Caida__ogg, 0.8, false);
		golpeSound = FlxG.sound.load(AssetPaths.Randomize__ogg,0.8,false);
		fondo = new FlxSprite(0,0);
		fondo.loadGraphic(AssetPaths.BackgroundCity__png, false, 512, 240);
		add(fondo);
		
		plataFondo = new FlxTypedGroup<FlxSprite>();
		add(plataFondo);
		
		drawEntities ("player");
		FlxG.camera.setScrollBounds(0, 5120, 0, 240);
		FlxG.camera.scroll = new FlxPoint(player.x, 0);
		FlxG.worldBounds.set(0, 0,5120, 240);
		scroll = true;				
		scoreText = new FlxText(10, 10, 0, "Score : " + Reg.score,8,true);
		scoreText.color = 0xFF000000;
		add(scoreText);
		highScoreText = new FlxText(100, 10, 0, "HighScore : " + Reg.highScore, 8, true);
		highScoreText.color = 0xFF000000;
		add(highScoreText);
		
		Reg.playerCoords = new FlxPoint(player.x, player.y);
		
		plataforms = new FlxTypedGroup<Plataform>();	
		var plat:Plataform;			
		plat = new Plataform(1);				
		plat.loadGraphic(AssetPaths.BaseIniFin__png,false,300,40);
		plat.x = 0;
		plat.y = 200;
		plataforms.add(plat);		
		add(plataforms);
		
		plat = new Plataform(1);				
		plat.x = 380;
		plat.y = 200;
		plataforms.add(plat);
		
		ene = new FlxTypedGroup<Ene1>();
		add(ene);
		dific = 200;		
		drawEntities ("player2");		
		
	}
	
	var timePlat : Int = 140;
	var timeEne : Int = 0;
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (player.x % 50 == 0 && player.x > xRecorrido){
			Reg.score++;
			UpdateScore();
			xRecorrido = player.x;
		}		
		
		FlxG.collide(plataforms, player);
		FlxG.collide(plataforms, ene);
		Collisions();
		if (player.alive)
		{
			CameraMovement();
			
			Player2Movi();
			PlayerMovementInCameraBounds();		 
			if (player.isTouching(FlxObject.FLOOR) && FlxG.keys.pressed.UP)
			{				
				player.velocity.y = -320;
				player.animation.play("Jump");
				jumpSound.play();
			}
			if (FlxG.keys.pressed.X){
				golpeSound.play();
				player.animation.play("Punch");
				player.punchActivate = true;
			}
		}
		
		if (timePlat >= 140)
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
		ActivateEnemies();
		if (eneSpawn)
			timeEne++;
		
		if (FlxG.keys.justPressed.R)
			FlxG.resetState();
	}
	
	private function ActivateEnemies()
	{
		if (timeEne >= dific)
		{
			timeEne = 0;
			if (dific > 130){
				dific -= 10;
			}
			else if (dific > 80){
				dific -= 5;
			}
			else if (dific > 30){
				dific -= 2;
			}
			drawEntities("enemigo");
		}
		for (i in ene)
		{
			if (!InCameraBounds(i))
			{				
				ene.remove(i);
				i.destroy();
			}
			else
			{				
				if (!i.isTouching(FlxObject.FLOOR) && !i.enSalto)
				{					
					i.velocity.y = -320;
					i.velocity.x = -50;
					i.enSalto = true;
				}
				if (i.isTouching(FlxObject.FLOOR) && i.enSalto)
				{	
					i.enSalto = false;
					i.velocity.x = -30;
				}				
			}
		}	
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
		FlxG.overlap(play2, ene, null, CollsionHandler);
		FlxG.overlap(player, ene, null, CollsionHandler);		
	}
	
	private function CollsionHandler(s1:FlxObject, s2:FlxObject):Bool
	{
		//La funcion que hace dependiendo de los sprites
		var sprite1:String = Type.getClassName(Type.getClass(s1));
		var sprite2:String = Type.getClassName(Type.getClass(s2));
		
		if (sprite1 == "sprites.Player2" && sprite2 == "sprites.Ene1")
		{
			if (!play2.secue)
			{
				var enemy: Dynamic = cast(s2, Ene1);
				eneSec = enemy;
				play2.secue = true;
			}
			return true;
		}
		
		if (sprite1 == "sprites.Player" && sprite2 == "sprites.Ene1")
		{
			if (FlxG.keys.pressed.X && !play2.secue)
			{
				var enemy: Dynamic = cast(s2, Ene1);
				ene.remove(enemy);
				enemy.kill;
				Reg.score++;
				UpdateScore();
				hitSound.play();
				player.punchActivate = true;
				player.animation.play("Punch");
			}
			return true;
		}		
		
		return false;
	}
	
	private function Player2Movi():Void
	{
		if (play2.alive)
		{
			if (!play2.secue)
			{
				play2.x = player.x - 20;
				play2.y = player.y;
			}
			else{
				play2.x = eneSec.x + 20;
				play2.y = eneSec.y;
				if (play2.x <= FlxG.camera.scroll.x -40 || play2.y >= 240){
					GameOver(false);
				}
			}
		}
	}
	
	private function PlayerMovementInCameraBounds():Void
	{
		var newScroll = FlxG.camera.scroll;

		if (player.x > newScroll.x + Reg.ScreenWidth - player.width)
		{
			player.x = newScroll.x + Reg.ScreenWidth - player.width;	
		}
		if (play2.x < newScroll.x)
		{
			player.x = newScroll.x + play2.width;
		}
		if (player.y > 200)
		{			
			caidaSound.play();
		}
		if (player.y > newScroll.y + Reg.ScreenHeight + player.height)
		{
			GameOver(false);	
		}
		if (player.y < newScroll.y)
		{
			player.y = newScroll.y;
		}
	}
	var sasa : Bool = false;
	private function CameraMovement():Void
	{
		var newScroll = FlxG.camera.scroll;
		if (scroll){
			
			if (player.x >= 5000){
				//Gano
				GameOver(true);
			}
			
			if (newScroll.x + 512 >= 4800 && !sasa)
			{				
				var plat:Plataform;
				sasa = true;
				plat = new Plataform(1);				
				plat.loadGraphic(AssetPaths.BaseIniFin__png,false,300,40);
				plat.x = 4820;
				plat.y = 200;
				plataforms.add(plat);
				eneSpawn = false;
			}
			else
			{
				newScroll.x += screenSpeed;
				FlxG.camera.scroll = newScroll;
				player.x += screenSpeed;
				scoreText.x += screenSpeed;
				highScoreText.x += screenSpeed;
				fondo.x += screenSpeed;
			}			
		}
	}
	
	private function InCameraBounds(sprite:FlxSprite):Bool
	{
		//Revisa si esta dentro de la camara
		var newScroll = FlxG.camera.scroll;

		if (sprite.x >newScroll.x + 800)
		{
			return false;
		}
		if (sprite.x < newScroll.x - 400)
		{
			return false;
		}
		if (sprite.y + sprite.height > newScroll.y + Reg.ScreenHeight + sprite.height)
		{
			return false;
		}
		if (sprite.y < newScroll.y)
		{
			trace(newScroll.y);
			return false;
		}
		return true;
	}
	
	private function drawEntities( entityName:String):Void
	{
		if (entityName == "player")
		{
			var X:Float = 0;
			var Y:Float = 160;
			
			player = new Player(X,Y);
			add(player);
		}
		
		var newScroll = FlxG.camera.scroll;
		if (entityName == "plataform")
		{					
			var plat:Plataform;
			for (i in 0...2){
				plat = new Plataform(i,newScroll.x+530);				
				if(i == 0) plataFondo.add(plat.secBase);
				plataforms.add(plat);				
			}
		}
		
		if (entityName == "enemigo")
		{			
			var enemy:Ene1;
			enemy = new Ene1(newScroll.x+512, 0);
			ene.add(enemy);
		}
		
		if (entityName == "player2")
		{
			var X:Float = player.x - 22;
			var Y:Float = player.y;			
			play2 = new Player2(X,Y);
			add(play2);
		}
	}
}
