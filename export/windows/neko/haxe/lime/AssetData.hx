package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
			path.set ("assets/data/data-goes-here.txt", "assets/data/data-goes-here.txt");
			type.set ("assets/data/data-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/Hope.oep", "assets/data/Hope.oep");
			type.set ("assets/data/Hope.oep", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/level1.oel", "assets/data/level1.oel");
			type.set ("assets/data/level1.oel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/level2.oel", "assets/data/level2.oel");
			type.set ("assets/data/level2.oel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/background1.png", "assets/images/background1.png");
			type.set ("assets/images/background1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/background2.png", "assets/images/background2.png");
			type.set ("assets/images/background2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/bg.png", "assets/images/bg.png");
			type.set ("assets/images/bg.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Bullet.png", "assets/images/Bullet.png");
			type.set ("assets/images/Bullet.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Ene1.png", "assets/images/Ene1.png");
			type.set ("assets/images/Ene1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Ene2.png", "assets/images/Ene2.png");
			type.set ("assets/images/Ene2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Ene3.png", "assets/images/Ene3.png");
			type.set ("assets/images/Ene3.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Ene4.png", "assets/images/Ene4.png");
			type.set ("assets/images/Ene4.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Granyan.png", "assets/images/Granyan.png");
			type.set ("assets/images/Granyan.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/GranyanDefeated.png", "assets/images/GranyanDefeated.png");
			type.set ("assets/images/GranyanDefeated.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/ground.png", "assets/images/ground.png");
			type.set ("assets/images/ground.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/images-go-here.txt", "assets/images/images-go-here.txt");
			type.set ("assets/images/images-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/intro/bl4ckb0ne-logo.png", "assets/images/intro/bl4ckb0ne-logo.png");
			type.set ("assets/images/intro/bl4ckb0ne-logo.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/intro/particles.png", "assets/images/intro/particles.png");
			type.set ("assets/images/intro/particles.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Missile.png", "assets/images/Missile.png");
			type.set ("assets/images/Missile.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Nave.png", "assets/images/Nave.png");
			type.set ("assets/images/Nave.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Option.png", "assets/images/Option.png");
			type.set ("assets/images/Option.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/player.png", "assets/images/player.png");
			type.set ("assets/images/player.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Shield.png", "assets/images/Shield.png");
			type.set ("assets/images/Shield.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/sun.png", "assets/images/sun.png");
			type.set ("assets/images/sun.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/tile.png", "assets/images/tile.png");
			type.set ("assets/images/tile.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/tileset.png", "assets/images/tileset.png");
			type.set ("assets/images/tileset.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Up.png", "assets/images/Up.png");
			type.set ("assets/images/Up.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/UpBar.png", "assets/images/UpBar.png");
			type.set ("assets/images/UpBar.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/music/music-goes-here.txt", "assets/music/music-goes-here.txt");
			type.set ("assets/music/music-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/sounds/ActivatePowerUp.wav", "assets/sounds/ActivatePowerUp.wav");
			type.set ("assets/sounds/ActivatePowerUp.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/BossHurt.wav", "assets/sounds/BossHurt.wav");
			type.set ("assets/sounds/BossHurt.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/Explosion.wav", "assets/sounds/Explosion.wav");
			type.set ("assets/sounds/Explosion.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/Powerup.wav", "assets/sounds/Powerup.wav");
			type.set ("assets/sounds/Powerup.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/Shoot.wav", "assets/sounds/Shoot.wav");
			type.set ("assets/sounds/Shoot.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/sounds-go-here.txt", "assets/sounds/sounds-go-here.txt");
			type.set ("assets/sounds/sounds-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/sounds/ThemeSong.wav", "assets/sounds/ThemeSong.wav");
			type.set ("assets/sounds/ThemeSong.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/sounds/beep.ogg", "flixel/sounds/beep.ogg");
			type.set ("flixel/sounds/beep.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/sounds/flixel.ogg", "flixel/sounds/flixel.ogg");
			type.set ("flixel/sounds/flixel.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/fonts/nokiafc22.ttf", "flixel/fonts/nokiafc22.ttf");
			type.set ("flixel/fonts/nokiafc22.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/fonts/monsterrat.ttf", "flixel/fonts/monsterrat.ttf");
			type.set ("flixel/fonts/monsterrat.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/images/ui/button.png", "flixel/images/ui/button.png");
			type.set ("flixel/images/ui/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/images/logo/default.png", "flixel/images/logo/default.png");
			type.set ("flixel/images/logo/default.png", Reflect.field (AssetType, "image".toUpperCase ()));
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData
