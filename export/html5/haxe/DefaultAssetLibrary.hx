package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Future;
import lime.app.Preloader;
import lime.app.Promise;
import lime.audio.AudioSource;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Image;
import lime.net.HTTPRequest;
import lime.system.CFFI;
import lime.text.Font;
import lime.utils.Bytes;
import lime.utils.UInt8Array;
import lime.Assets;

#if sys
import sys.FileSystem;
#end

#if flash
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if (openfl && !flash)
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		
		
		#end
		
		#if flash
		
		className.set ("assets/data/data-goes-here.txt", __ASSET__assets_data_data_goes_here_txt);
		type.set ("assets/data/data-goes-here.txt", AssetType.TEXT);
		className.set ("assets/data/Hope.oep", __ASSET__assets_data_hope_oep);
		type.set ("assets/data/Hope.oep", AssetType.TEXT);
		className.set ("assets/data/level1.oel", __ASSET__assets_data_level1_oel);
		type.set ("assets/data/level1.oel", AssetType.TEXT);
		className.set ("assets/data/level2.oel", __ASSET__assets_data_level2_oel);
		type.set ("assets/data/level2.oel", AssetType.TEXT);
		className.set ("assets/images/background1.png", __ASSET__assets_images_background1_png);
		type.set ("assets/images/background1.png", AssetType.IMAGE);
		className.set ("assets/images/background2.png", __ASSET__assets_images_background2_png);
		type.set ("assets/images/background2.png", AssetType.IMAGE);
		className.set ("assets/images/bg.png", __ASSET__assets_images_bg_png);
		type.set ("assets/images/bg.png", AssetType.IMAGE);
		className.set ("assets/images/Bullet.png", __ASSET__assets_images_bullet_png);
		type.set ("assets/images/Bullet.png", AssetType.IMAGE);
		className.set ("assets/images/Ene1.png", __ASSET__assets_images_ene1_png);
		type.set ("assets/images/Ene1.png", AssetType.IMAGE);
		className.set ("assets/images/Ene2.png", __ASSET__assets_images_ene2_png);
		type.set ("assets/images/Ene2.png", AssetType.IMAGE);
		className.set ("assets/images/Ene3.png", __ASSET__assets_images_ene3_png);
		type.set ("assets/images/Ene3.png", AssetType.IMAGE);
		className.set ("assets/images/Ene4.png", __ASSET__assets_images_ene4_png);
		type.set ("assets/images/Ene4.png", AssetType.IMAGE);
		className.set ("assets/images/Granyan.png", __ASSET__assets_images_granyan_png);
		type.set ("assets/images/Granyan.png", AssetType.IMAGE);
		className.set ("assets/images/GranyanDefeated.png", __ASSET__assets_images_granyandefeated_png);
		type.set ("assets/images/GranyanDefeated.png", AssetType.IMAGE);
		className.set ("assets/images/ground.png", __ASSET__assets_images_ground_png);
		type.set ("assets/images/ground.png", AssetType.IMAGE);
		className.set ("assets/images/images-go-here.txt", __ASSET__assets_images_images_go_here_txt);
		type.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		className.set ("assets/images/intro/bl4ckb0ne-logo.png", __ASSET__assets_images_intro_bl4ckb0ne_logo_png);
		type.set ("assets/images/intro/bl4ckb0ne-logo.png", AssetType.IMAGE);
		className.set ("assets/images/intro/particles.png", __ASSET__assets_images_intro_particles_png);
		type.set ("assets/images/intro/particles.png", AssetType.IMAGE);
		className.set ("assets/images/Missile.png", __ASSET__assets_images_missile_png);
		type.set ("assets/images/Missile.png", AssetType.IMAGE);
		className.set ("assets/images/Nave.png", __ASSET__assets_images_nave_png);
		type.set ("assets/images/Nave.png", AssetType.IMAGE);
		className.set ("assets/images/Option.png", __ASSET__assets_images_option_png);
		type.set ("assets/images/Option.png", AssetType.IMAGE);
		className.set ("assets/images/player.png", __ASSET__assets_images_player_png);
		type.set ("assets/images/player.png", AssetType.IMAGE);
		className.set ("assets/images/Shield.png", __ASSET__assets_images_shield_png);
		type.set ("assets/images/Shield.png", AssetType.IMAGE);
		className.set ("assets/images/sun.png", __ASSET__assets_images_sun_png);
		type.set ("assets/images/sun.png", AssetType.IMAGE);
		className.set ("assets/images/tile.png", __ASSET__assets_images_tile_png);
		type.set ("assets/images/tile.png", AssetType.IMAGE);
		className.set ("assets/images/tileset.png", __ASSET__assets_images_tileset_png);
		type.set ("assets/images/tileset.png", AssetType.IMAGE);
		className.set ("assets/images/Up.png", __ASSET__assets_images_up_png);
		type.set ("assets/images/Up.png", AssetType.IMAGE);
		className.set ("assets/images/UpBar.png", __ASSET__assets_images_upbar_png);
		type.set ("assets/images/UpBar.png", AssetType.IMAGE);
		className.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		className.set ("assets/sounds/ActivatePowerUp.wav", __ASSET__assets_sounds_activatepowerup_wav);
		type.set ("assets/sounds/ActivatePowerUp.wav", AssetType.SOUND);
		className.set ("assets/sounds/BossHurt.wav", __ASSET__assets_sounds_bosshurt_wav);
		type.set ("assets/sounds/BossHurt.wav", AssetType.SOUND);
		className.set ("assets/sounds/Explosion.wav", __ASSET__assets_sounds_explosion_wav);
		type.set ("assets/sounds/Explosion.wav", AssetType.SOUND);
		className.set ("assets/sounds/Powerup.wav", __ASSET__assets_sounds_powerup_wav);
		type.set ("assets/sounds/Powerup.wav", AssetType.SOUND);
		className.set ("assets/sounds/Shoot.wav", __ASSET__assets_sounds_shoot_wav);
		type.set ("assets/sounds/Shoot.wav", AssetType.SOUND);
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		className.set ("assets/sounds/ThemeSong.wav", __ASSET__assets_sounds_themesong_wav);
		type.set ("assets/sounds/ThemeSong.wav", AssetType.SOUND);
		className.set ("flixel/sounds/beep.ogg", __ASSET__flixel_sounds_beep_ogg);
		type.set ("flixel/sounds/beep.ogg", AssetType.SOUND);
		className.set ("flixel/sounds/flixel.ogg", __ASSET__flixel_sounds_flixel_ogg);
		type.set ("flixel/sounds/flixel.ogg", AssetType.SOUND);
		className.set ("flixel/fonts/nokiafc22.ttf", __ASSET__flixel_fonts_nokiafc22_ttf);
		type.set ("flixel/fonts/nokiafc22.ttf", AssetType.FONT);
		className.set ("flixel/fonts/monsterrat.ttf", __ASSET__flixel_fonts_monsterrat_ttf);
		type.set ("flixel/fonts/monsterrat.ttf", AssetType.FONT);
		className.set ("flixel/images/ui/button.png", __ASSET__flixel_images_ui_button_png);
		type.set ("flixel/images/ui/button.png", AssetType.IMAGE);
		className.set ("flixel/images/logo/default.png", __ASSET__flixel_images_logo_default_png);
		type.set ("flixel/images/logo/default.png", AssetType.IMAGE);
		
		
		#elseif html5
		
		var id;
		id = "assets/data/data-goes-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/Hope.oep";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/level1.oel";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/level2.oel";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/background1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/background2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/bg.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Bullet.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Ene1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Ene2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Ene3.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Ene4.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Granyan.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/GranyanDefeated.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/ground.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/images-go-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/intro/bl4ckb0ne-logo.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/intro/particles.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Missile.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Nave.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Option.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/player.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Shield.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sun.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/tile.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/tileset.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Up.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/UpBar.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/music/music-goes-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/sounds/ActivatePowerUp.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/BossHurt.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Explosion.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Powerup.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Shoot.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/sounds-go-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/sounds/ThemeSong.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "flixel/sounds/beep.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "flixel/sounds/flixel.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "flixel/fonts/nokiafc22.ttf";
		className.set (id, __ASSET__flixel_fonts_nokiafc22_ttf);
		
		type.set (id, AssetType.FONT);
		id = "flixel/fonts/monsterrat.ttf";
		className.set (id, __ASSET__flixel_fonts_monsterrat_ttf);
		
		type.set (id, AssetType.FONT);
		id = "flixel/images/ui/button.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/images/logo/default.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		
		
		var assetsPrefix = null;
		if (ApplicationMain.config != null && Reflect.hasField (ApplicationMain.config, "assetsPrefix")) {
			assetsPrefix = ApplicationMain.config.assetsPrefix;
		}
		if (assetsPrefix != null) {
			for (k in path.keys()) {
				path.set(k, assetsPrefix + path[k]);
			}
		}
		
		#else
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		
		className.set ("assets/data/data-goes-here.txt", __ASSET__assets_data_data_goes_here_txt);
		type.set ("assets/data/data-goes-here.txt", AssetType.TEXT);
		
		className.set ("assets/data/Hope.oep", __ASSET__assets_data_hope_oep);
		type.set ("assets/data/Hope.oep", AssetType.TEXT);
		
		className.set ("assets/data/level1.oel", __ASSET__assets_data_level1_oel);
		type.set ("assets/data/level1.oel", AssetType.TEXT);
		
		className.set ("assets/data/level2.oel", __ASSET__assets_data_level2_oel);
		type.set ("assets/data/level2.oel", AssetType.TEXT);
		
		className.set ("assets/images/background1.png", __ASSET__assets_images_background1_png);
		type.set ("assets/images/background1.png", AssetType.IMAGE);
		
		className.set ("assets/images/background2.png", __ASSET__assets_images_background2_png);
		type.set ("assets/images/background2.png", AssetType.IMAGE);
		
		className.set ("assets/images/bg.png", __ASSET__assets_images_bg_png);
		type.set ("assets/images/bg.png", AssetType.IMAGE);
		
		className.set ("assets/images/Bullet.png", __ASSET__assets_images_bullet_png);
		type.set ("assets/images/Bullet.png", AssetType.IMAGE);
		
		className.set ("assets/images/Ene1.png", __ASSET__assets_images_ene1_png);
		type.set ("assets/images/Ene1.png", AssetType.IMAGE);
		
		className.set ("assets/images/Ene2.png", __ASSET__assets_images_ene2_png);
		type.set ("assets/images/Ene2.png", AssetType.IMAGE);
		
		className.set ("assets/images/Ene3.png", __ASSET__assets_images_ene3_png);
		type.set ("assets/images/Ene3.png", AssetType.IMAGE);
		
		className.set ("assets/images/Ene4.png", __ASSET__assets_images_ene4_png);
		type.set ("assets/images/Ene4.png", AssetType.IMAGE);
		
		className.set ("assets/images/Granyan.png", __ASSET__assets_images_granyan_png);
		type.set ("assets/images/Granyan.png", AssetType.IMAGE);
		
		className.set ("assets/images/GranyanDefeated.png", __ASSET__assets_images_granyandefeated_png);
		type.set ("assets/images/GranyanDefeated.png", AssetType.IMAGE);
		
		className.set ("assets/images/ground.png", __ASSET__assets_images_ground_png);
		type.set ("assets/images/ground.png", AssetType.IMAGE);
		
		className.set ("assets/images/images-go-here.txt", __ASSET__assets_images_images_go_here_txt);
		type.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		
		className.set ("assets/images/intro/bl4ckb0ne-logo.png", __ASSET__assets_images_intro_bl4ckb0ne_logo_png);
		type.set ("assets/images/intro/bl4ckb0ne-logo.png", AssetType.IMAGE);
		
		className.set ("assets/images/intro/particles.png", __ASSET__assets_images_intro_particles_png);
		type.set ("assets/images/intro/particles.png", AssetType.IMAGE);
		
		className.set ("assets/images/Missile.png", __ASSET__assets_images_missile_png);
		type.set ("assets/images/Missile.png", AssetType.IMAGE);
		
		className.set ("assets/images/Nave.png", __ASSET__assets_images_nave_png);
		type.set ("assets/images/Nave.png", AssetType.IMAGE);
		
		className.set ("assets/images/Option.png", __ASSET__assets_images_option_png);
		type.set ("assets/images/Option.png", AssetType.IMAGE);
		
		className.set ("assets/images/player.png", __ASSET__assets_images_player_png);
		type.set ("assets/images/player.png", AssetType.IMAGE);
		
		className.set ("assets/images/Shield.png", __ASSET__assets_images_shield_png);
		type.set ("assets/images/Shield.png", AssetType.IMAGE);
		
		className.set ("assets/images/sun.png", __ASSET__assets_images_sun_png);
		type.set ("assets/images/sun.png", AssetType.IMAGE);
		
		className.set ("assets/images/tile.png", __ASSET__assets_images_tile_png);
		type.set ("assets/images/tile.png", AssetType.IMAGE);
		
		className.set ("assets/images/tileset.png", __ASSET__assets_images_tileset_png);
		type.set ("assets/images/tileset.png", AssetType.IMAGE);
		
		className.set ("assets/images/Up.png", __ASSET__assets_images_up_png);
		type.set ("assets/images/Up.png", AssetType.IMAGE);
		
		className.set ("assets/images/UpBar.png", __ASSET__assets_images_upbar_png);
		type.set ("assets/images/UpBar.png", AssetType.IMAGE);
		
		className.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		
		className.set ("assets/sounds/ActivatePowerUp.wav", __ASSET__assets_sounds_activatepowerup_wav);
		type.set ("assets/sounds/ActivatePowerUp.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/BossHurt.wav", __ASSET__assets_sounds_bosshurt_wav);
		type.set ("assets/sounds/BossHurt.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/Explosion.wav", __ASSET__assets_sounds_explosion_wav);
		type.set ("assets/sounds/Explosion.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/Powerup.wav", __ASSET__assets_sounds_powerup_wav);
		type.set ("assets/sounds/Powerup.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/Shoot.wav", __ASSET__assets_sounds_shoot_wav);
		type.set ("assets/sounds/Shoot.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		
		className.set ("assets/sounds/ThemeSong.wav", __ASSET__assets_sounds_themesong_wav);
		type.set ("assets/sounds/ThemeSong.wav", AssetType.SOUND);
		
		className.set ("flixel/sounds/beep.ogg", __ASSET__flixel_sounds_beep_ogg);
		type.set ("flixel/sounds/beep.ogg", AssetType.SOUND);
		
		className.set ("flixel/sounds/flixel.ogg", __ASSET__flixel_sounds_flixel_ogg);
		type.set ("flixel/sounds/flixel.ogg", AssetType.SOUND);
		
		className.set ("flixel/fonts/nokiafc22.ttf", __ASSET__flixel_fonts_nokiafc22_ttf);
		type.set ("flixel/fonts/nokiafc22.ttf", AssetType.FONT);
		
		className.set ("flixel/fonts/monsterrat.ttf", __ASSET__flixel_fonts_monsterrat_ttf);
		type.set ("flixel/fonts/monsterrat.ttf", AssetType.FONT);
		
		className.set ("flixel/images/ui/button.png", __ASSET__flixel_images_ui_button_png);
		type.set ("flixel/images/ui/button.png", AssetType.IMAGE);
		
		className.set ("flixel/images/logo/default.png", __ASSET__flixel_images_logo_default_png);
		type.set ("flixel/images/logo/default.png", AssetType.IMAGE);
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						onChange.dispatch ();
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == requestedType || ((requestedType == SOUND || requestedType == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if (requestedType == BINARY && (assetType == BINARY || assetType == TEXT || assetType == IMAGE)) {
				
				return true;
				
			} else if (requestedType == TEXT && assetType == BINARY) {
				
				return true;
				
			} else if (requestedType == null || path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (requestedType == BINARY || requestedType == null || (assetType == BINARY && requestedType == TEXT)) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getAudioBuffer (id:String):AudioBuffer {
		
		#if flash
		
		var buffer = new AudioBuffer ();
		buffer.src = cast (Type.createInstance (className.get (id), []), Sound);
		return buffer;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return AudioBuffer.fromBytes (cast (Type.createInstance (className.get (id), []), Bytes));
		else return AudioBuffer.fromFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):Bytes {
		
		#if flash
		
		switch (type.get (id)) {
			
			case TEXT, BINARY:
				
				return Bytes.ofData (cast (Type.createInstance (className.get (id), []), flash.utils.ByteArray));
			
			case IMAGE:
				
				var bitmapData = cast (Type.createInstance (className.get (id), []), BitmapData);
				return Bytes.ofData (bitmapData.getPixels (bitmapData.rect));
			
			default:
				
				return null;
			
		}
		
		return cast (Type.createInstance (className.get (id), []), Bytes);
		
		#elseif html5
		
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var bytes = loader.bytes;
		
		if (bytes != null) {
			
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Bytes);
		else return Bytes.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if flash
		
		var src = Type.createInstance (className.get (id), []);
		
		var font = new Font (src.fontName);
		font.src = src;
		return font;
		
		#elseif html5
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Font);
			
		} else {
			
			return Font.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	public override function getImage (id:String):Image {
		
		#if flash
		
		return Image.fromBitmapData (cast (Type.createInstance (className.get (id), []), BitmapData));
		
		#elseif html5
		
		return Image.fromImageElement (Preloader.images.get (path.get (id)));
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Image);
			
		} else {
			
			return Image.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	/*public override function getMusic (id:String):Dynamic {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		//var sound = new Sound ();
		//sound.__buffer = true;
		//sound.load (new URLRequest (path.get (id)));
		//return sound;
		return null;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}*/
	
	
	public override function getPath (id:String):String {
		
		//#if ios
		
		//return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		//#else
		
		return path.get (id);
		
		//#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if html5
		
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var bytes = loader.bytes;
		
		if (bytes != null) {
			
			return bytes.getString (0, bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.getString (0, bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		
		#if flash
		
		//if (requestedType != AssetType.MUSIC && requestedType != AssetType.SOUND) {
			
			return className.exists (id);
			
		//}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:String):Array<String> {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (requestedType == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadAudioBuffer (id:String):Future<AudioBuffer> {
		
		var promise = new Promise<AudioBuffer> ();
		
		#if (flash)
		
		if (path.exists (id)) {
			
			var soundLoader = new Sound ();
			soundLoader.addEventListener (Event.COMPLETE, function (event) {
				
				var audioBuffer:AudioBuffer = new AudioBuffer();
				audioBuffer.src = event.currentTarget;
				promise.complete (audioBuffer);
				
			});
			soundLoader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			soundLoader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			soundLoader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getAudioBuffer (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<AudioBuffer> (function () return getAudioBuffer (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadBytes (id:String):Future<Bytes> {
		
		var promise = new Promise<Bytes> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.dataFormat = flash.net.URLLoaderDataFormat.BINARY;
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = Bytes.ofData (event.currentTarget.data);
				promise.complete (bytes);
				
			});
			loader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var request = new HTTPRequest ();
			promise.completeWith (request.load (path.get (id) + "?" + Assets.cache.version));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Bytes> (function () return getBytes (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadImage (id:String):Future<Image> {
		
		var promise = new Promise<Image> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bitmapData = cast (event.currentTarget.content, Bitmap).bitmapData;
				promise.complete (Image.fromBitmapData (bitmapData));
				
			});
			loader.contentLoaderInfo.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.contentLoaderInfo.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var image = new js.html.Image ();
			image.onload = function (_):Void {
				
				promise.complete (Image.fromImageElement (image));
				
			}
			image.onerror = promise.error;
			image.src = path.get (id) + "?" + Assets.cache.version;
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Image> (function () return getImage (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = Bytes.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = Bytes.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = Bytes.readFile ("assets/manifest");
			#elseif (mac && java)
			var bytes = Bytes.readFile ("../Resources/manifest");
			#elseif (ios || tvos)
			var bytes = Bytes.readFile ("assets/manifest");
			#else
			var bytes = Bytes.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				if (bytes.length > 0) {
					
					var data = bytes.getString (0, bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								#if (ios || tvos)
								path.set (asset.id, "assets/" + asset.path);
								#else
								path.set (asset.id, asset.path);
								#end
								type.set (asset.id, cast (asset.type, AssetType));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	public override function loadText (id:String):Future<String> {
		
		var promise = new Promise<String> ();
		
		#if html5
		
		if (path.exists (id)) {
			
			var request = new HTTPRequest ();
			var future = request.load (path.get (id) + "?" + Assets.cache.version);
			future.onProgress (function (progress) promise.progress (progress));
			future.onError (function (msg) promise.error (msg));
			future.onComplete (function (bytes) promise.complete (bytes.getString (0, bytes.length)));
			
		} else {
			
			promise.complete (getText (id));
			
		}
		
		#else
		
		promise.completeWith (loadBytes (id).then (function (bytes) {
			
			return new Future<String> (function () {
				
				if (bytes == null) {
					
					return null;
					
				} else {
					
					return bytes.getString (0, bytes.length);
					
				}
				
			});
			
		}));
		
		#end
		
		return promise.future;
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__assets_data_data_goes_here_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_hope_oep extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_level1_oel extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_level2_oel extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_background1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_background2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_bg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_bullet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_ene1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_ene2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_ene3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_ene4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_granyan_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_granyandefeated_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_ground_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_images_go_here_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_intro_bl4ckb0ne_logo_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_intro_particles_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_missile_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_nave_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_option_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_player_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_shield_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sun_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_tile_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_tileset_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_up_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_upbar_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_music_music_goes_here_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_activatepowerup_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_bosshurt_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_explosion_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_powerup_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_shoot_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_themesong_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_sounds_beep_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }


#elseif html5







































@:keep #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { super (); name = "Nokia Cellphone FC Small"; } } 
@:keep #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { super (); name = "Monsterrat"; } } 




#else



#if (windows || mac || linux || cpp)


@:file("assets/data/data-goes-here.txt") #if display private #end class __ASSET__assets_data_data_goes_here_txt extends lime.utils.Bytes {}
@:file("assets/data/Hope.oep") #if display private #end class __ASSET__assets_data_hope_oep extends lime.utils.Bytes {}
@:file("assets/data/level1.oel") #if display private #end class __ASSET__assets_data_level1_oel extends lime.utils.Bytes {}
@:file("assets/data/level2.oel") #if display private #end class __ASSET__assets_data_level2_oel extends lime.utils.Bytes {}
@:image("assets/images/background1.png") #if display private #end class __ASSET__assets_images_background1_png extends lime.graphics.Image {}
@:image("assets/images/background2.png") #if display private #end class __ASSET__assets_images_background2_png extends lime.graphics.Image {}
@:image("assets/images/bg.png") #if display private #end class __ASSET__assets_images_bg_png extends lime.graphics.Image {}
@:image("assets/images/Bullet.png") #if display private #end class __ASSET__assets_images_bullet_png extends lime.graphics.Image {}
@:image("assets/images/Ene1.png") #if display private #end class __ASSET__assets_images_ene1_png extends lime.graphics.Image {}
@:image("assets/images/Ene2.png") #if display private #end class __ASSET__assets_images_ene2_png extends lime.graphics.Image {}
@:image("assets/images/Ene3.png") #if display private #end class __ASSET__assets_images_ene3_png extends lime.graphics.Image {}
@:image("assets/images/Ene4.png") #if display private #end class __ASSET__assets_images_ene4_png extends lime.graphics.Image {}
@:image("assets/images/Granyan.png") #if display private #end class __ASSET__assets_images_granyan_png extends lime.graphics.Image {}
@:image("assets/images/GranyanDefeated.png") #if display private #end class __ASSET__assets_images_granyandefeated_png extends lime.graphics.Image {}
@:image("assets/images/ground.png") #if display private #end class __ASSET__assets_images_ground_png extends lime.graphics.Image {}
@:file("assets/images/images-go-here.txt") #if display private #end class __ASSET__assets_images_images_go_here_txt extends lime.utils.Bytes {}
@:image("assets/images/intro/bl4ckb0ne-logo.png") #if display private #end class __ASSET__assets_images_intro_bl4ckb0ne_logo_png extends lime.graphics.Image {}
@:image("assets/images/intro/particles.png") #if display private #end class __ASSET__assets_images_intro_particles_png extends lime.graphics.Image {}
@:image("assets/images/Missile.png") #if display private #end class __ASSET__assets_images_missile_png extends lime.graphics.Image {}
@:image("assets/images/Nave.png") #if display private #end class __ASSET__assets_images_nave_png extends lime.graphics.Image {}
@:image("assets/images/Option.png") #if display private #end class __ASSET__assets_images_option_png extends lime.graphics.Image {}
@:image("assets/images/player.png") #if display private #end class __ASSET__assets_images_player_png extends lime.graphics.Image {}
@:image("assets/images/Shield.png") #if display private #end class __ASSET__assets_images_shield_png extends lime.graphics.Image {}
@:image("assets/images/sun.png") #if display private #end class __ASSET__assets_images_sun_png extends lime.graphics.Image {}
@:image("assets/images/tile.png") #if display private #end class __ASSET__assets_images_tile_png extends lime.graphics.Image {}
@:image("assets/images/tileset.png") #if display private #end class __ASSET__assets_images_tileset_png extends lime.graphics.Image {}
@:image("assets/images/Up.png") #if display private #end class __ASSET__assets_images_up_png extends lime.graphics.Image {}
@:image("assets/images/UpBar.png") #if display private #end class __ASSET__assets_images_upbar_png extends lime.graphics.Image {}
@:file("assets/music/music-goes-here.txt") #if display private #end class __ASSET__assets_music_music_goes_here_txt extends lime.utils.Bytes {}
@:file("assets/sounds/ActivatePowerUp.wav") #if display private #end class __ASSET__assets_sounds_activatepowerup_wav extends lime.utils.Bytes {}
@:file("assets/sounds/BossHurt.wav") #if display private #end class __ASSET__assets_sounds_bosshurt_wav extends lime.utils.Bytes {}
@:file("assets/sounds/Explosion.wav") #if display private #end class __ASSET__assets_sounds_explosion_wav extends lime.utils.Bytes {}
@:file("assets/sounds/Powerup.wav") #if display private #end class __ASSET__assets_sounds_powerup_wav extends lime.utils.Bytes {}
@:file("assets/sounds/Shoot.wav") #if display private #end class __ASSET__assets_sounds_shoot_wav extends lime.utils.Bytes {}
@:file("assets/sounds/sounds-go-here.txt") #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends lime.utils.Bytes {}
@:file("assets/sounds/ThemeSong.wav") #if display private #end class __ASSET__assets_sounds_themesong_wav extends lime.utils.Bytes {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/4,2,0/assets/sounds/beep.ogg") #if display private #end class __ASSET__flixel_sounds_beep_ogg extends lime.utils.Bytes {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/4,2,0/assets/sounds/flixel.ogg") #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends lime.utils.Bytes {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/4,2,0/assets/fonts/nokiafc22.ttf") #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/4,2,0/assets/fonts/monsterrat.ttf") #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:image("C:/HaxeToolkit/haxe/lib/flixel/4,2,0/assets/images/ui/button.png") #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel/4,2,0/assets/images/logo/default.png") #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}



#end
#end

#if (openfl && !flash)
@:keep #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__flixel_fonts_nokiafc22_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__flixel_fonts_monsterrat_ttf (); src = font.src; name = font.name; super (); }}

#end

#end