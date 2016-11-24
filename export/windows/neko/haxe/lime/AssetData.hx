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
			path.set ("assets/images/BackgroundCity.png", "assets/images/BackgroundCity.png");
			type.set ("assets/images/BackgroundCity.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/BaseIniFin.png", "assets/images/BaseIniFin.png");
			type.set ("assets/images/BaseIniFin.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Boss.png", "assets/images/Boss.png");
			type.set ("assets/images/Boss.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Enemy.png", "assets/images/Enemy.png");
			type.set ("assets/images/Enemy.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/FondoPlatChic.png", "assets/images/FondoPlatChic.png");
			type.set ("assets/images/FondoPlatChic.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/FondoPlatLarg.png", "assets/images/FondoPlatLarg.png");
			type.set ("assets/images/FondoPlatLarg.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/FondoPlatMed.png", "assets/images/FondoPlatMed.png");
			type.set ("assets/images/FondoPlatMed.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Heart.png", "assets/images/Heart.png");
			type.set ("assets/images/Heart.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Malos.png", "assets/images/Malos.png");
			type.set ("assets/images/Malos.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/P1A.png", "assets/images/P1A.png");
			type.set ("assets/images/P1A.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/P2A.png", "assets/images/P2A.png");
			type.set ("assets/images/P2A.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/PlatChic.png", "assets/images/PlatChic.png");
			type.set ("assets/images/PlatChic.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/PlatChicBase.png", "assets/images/PlatChicBase.png");
			type.set ("assets/images/PlatChicBase.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/PlatLargBase.png", "assets/images/PlatLargBase.png");
			type.set ("assets/images/PlatLargBase.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/PlatLargo.png", "assets/images/PlatLargo.png");
			type.set ("assets/images/PlatLargo.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/PlatMed.png", "assets/images/PlatMed.png");
			type.set ("assets/images/PlatMed.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/PlatMedBase.png", "assets/images/PlatMedBase.png");
			type.set ("assets/images/PlatMedBase.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Player.png", "assets/images/Player.png");
			type.set ("assets/images/Player.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Player2.png", "assets/images/Player2.png");
			type.set ("assets/images/Player2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/music/Ending.wav", "assets/music/Ending.wav");
			type.set ("assets/music/Ending.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/music/Intro.wav", "assets/music/Intro.wav");
			type.set ("assets/music/Intro.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/music/music-goes-here.txt", "assets/music/music-goes-here.txt");
			type.set ("assets/music/music-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/music/MuteCity.wav", "assets/music/MuteCity.wav");
			type.set ("assets/music/MuteCity.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/Caida.wav", "assets/sounds/Caida.wav");
			type.set ("assets/sounds/Caida.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/Hit.wav", "assets/sounds/Hit.wav");
			type.set ("assets/sounds/Hit.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/Jump.wav", "assets/sounds/Jump.wav");
			type.set ("assets/sounds/Jump.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/Randomize.wav", "assets/sounds/Randomize.wav");
			type.set ("assets/sounds/Randomize.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/sounds-go-here.txt", "assets/sounds/sounds-go-here.txt");
			type.set ("assets/sounds/sounds-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
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
