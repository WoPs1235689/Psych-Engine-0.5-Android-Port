package;

import flixel.FlxG;
import flixel.util.FlxSave;
import flixel.input.keyboard.FlxKey;
import flixel.graphics.FlxGraphic;
import Controls;

class ClientPrefs {
	public static var downScroll:Bool = false;
	public static var middleScroll:Bool = false;
	public static var showFPS:Bool = true;
	public static var flashing:Bool = true;
	public static var globalAntialiasing:Bool = true;
	public static var noteSplashes:Bool = true;
	public static var lowQuality:Bool = false;
	public static var framerate:Int = 60;
	public static var cursing:Bool = true;
	public static var violence:Bool = true;
	public static var camZooms:Bool = true;
	public static var hideHud:Bool = false;
	public static var noteOffset:Int = 0;
	public static var arrowHSV:Array<Array<Int>> = [[0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0]];
	public static var imagesPersist:Bool = false;
	public static var ghostTapping:Bool = true;
	public static var timeBarType:String = 'Time Left';
	public static var scoreZoom:Bool = true;
	public static var noReset:Bool = false;
	public static var healthBarAlpha:Float = 1;
// My Engine Stuff 
	// Tabi stuff lol
	public static var tabi:Bool = false;
	public static var tabiMax:Int = 2;
	// Ui stuff 
	public static var scoreType:String = 'Kade Engine';
	public static var scoreStyle:String = 'Random Engine';
	public static var healthCounter:Bool = false;
	public static var judgements:Bool = true;
	public static var iconBoping:Bool = false;
        public static var detachedCam:Bool = false;
	public static var detachedHUD:Bool = false;
	public static var keTimeBar:Bool = false;
	public static var songInfo:Bool = true;
	// Arrow opacity stuff
	public static var arrowOpacity:Float = 1;
	public static var opponentArrowOpacity:Float = 1;
	// Lane opacity stuff
	public static var laneOpacity:Float = 0;
	public static var opponentLaneOpacity:Float = 0;
	// Misc Stuff
	public static var antimash:Bool = true;
	public static var memoryCounter:Bool = false;
	public static var playHitSound:Bool = false;
	public static var normalCombo:Bool = false;
	public static var sustainhp:Bool = true;
// End
	#if mobile
	public static var controllerMode:Bool = true;
	#else
	public static var controllerMode:Bool = false;
	#end
	public static var gameplaySettings:Map<String, Dynamic> = [
		'scrollspeed' => 1.0,
		'songspeed' => 1.0,
		'healthgain' => 1.0,
		'healthloss' => 1.0,
		'instakill' => false,
		'practice' => false,
		'botplay' => false,
		'opponentplay' => false
	];

	public static var comboOffset:Array<Int> = [0, 0, 0, 0];
	public static var keSustains:Bool = false; //i was bored, okay?
	
	public static var ratingOffset:Int = 0;
	public static var sickWindow:Int = 45;
	public static var goodWindow:Int = 90;
	public static var badWindow:Int = 135;
	public static var safeFrames:Float = 10;

	//Every key has two binds, add your key bind down here and then add your control on options/ControlsSubState.hx and Controls.hx
	public static var keyBinds:Map<String, Array<FlxKey>> = [
		//Key Bind, Name for ControlsSubState
		'note_left'		=> [A, LEFT],
		'note_down'		=> [S, DOWN],
		'note_up'		=> [W, UP],
		'note_right'	=> [D, RIGHT],
		
		'ui_left'		=> [A, LEFT],
		'ui_down'		=> [S, DOWN],
		'ui_up'			=> [W, UP],
		'ui_right'		=> [D, RIGHT],
		
		'accept'		=> [SPACE, ENTER],
		'back'			=> [BACKSPACE, ESCAPE],
		'pause'			=> [ENTER, ESCAPE],
		'reset'			=> [R, NONE],
		
		'volume_mute'	=> [ZERO, NONE],
		'volume_up'		=> [NUMPADPLUS, PLUS],
		'volume_down'	=> [NUMPADMINUS, MINUS],
		
		'debug_1'		=> [SEVEN, NONE],
		'debug_2'		=> [EIGHT, NONE]
	];
	public static var defaultKeys:Map<String, Array<FlxKey>> = null;

	public static function loadDefaultKeys() {
		defaultKeys = keyBinds.copy();
		//trace(defaultKeys);
	}

	public static function saveSettings() {
		FlxG.save.data.downScroll = downScroll;
		FlxG.save.data.middleScroll = middleScroll;
		FlxG.save.data.showFPS = showFPS;
		FlxG.save.data.flashing = flashing;
		FlxG.save.data.globalAntialiasing = globalAntialiasing;
		FlxG.save.data.noteSplashes = noteSplashes;
		FlxG.save.data.lowQuality = lowQuality;
		FlxG.save.data.framerate = framerate;
		//FlxG.save.data.cursing = cursing;
		//FlxG.save.data.violence = violence;
		FlxG.save.data.camZooms = camZooms;
		FlxG.save.data.noteOffset = noteOffset;
		FlxG.save.data.hideHud = hideHud;
		FlxG.save.data.arrowHSV = arrowHSV;
		FlxG.save.data.imagesPersist = imagesPersist;
		FlxG.save.data.ghostTapping = ghostTapping;
		FlxG.save.data.timeBarType = timeBarType;
		FlxG.save.data.scoreZoom = scoreZoom;
		FlxG.save.data.noReset = noReset;
		FlxG.save.data.healthBarAlpha = healthBarAlpha;
		FlxG.save.data.comboOffset = comboOffset;
		FlxG.save.data.achievementsMap = Achievements.achievementsMap;
		FlxG.save.data.henchmenDeath = Achievements.henchmenDeath;
// My Engine stuff
		// Tabi stuff
		FlxG.save.data.tabi = tabi;
		FlxG.save.data.tabiMax = tabiMax;
		// Misc stuff
		FlxG.save.data.memoryCounter = memoryCounter;
		FlxG.save.data.antimash = antimash;
		FlxG.save.data.playHitSound = playHitSound;
		FlxG.save.data.sustainhp = sustainhp;
		// UI stuff
		FlxG.save.data.judgements = judgements;
		FlxG.save.data.healthCounter = healthCounter;
		FlxG.save.data.scoreType = scoreType;
		FlxG.save.data.scoreStyle = scoreStyle;
		FlxG.save.data.iconBoping = iconBoping;
		FlxG.save.data.detachedCam = detachedCam;
		FlxG.save.data.detachedHUD = detachedHUD;
		FlxG.save.data.songInfo = songInfo;
		FlxG.save.data.keTimeBar = keTimeBar;
		FlxG.save.data.normalCombo = normalCombo;
		// Arrow opacity
		FlxG.save.data.arrowOpacity = arrowOpacity;
		FlxG.save.data.opponentArrowOpacity = opponentArrowOpacity;
		// Lane opacity 
		FlxG.save.data.laneOpacity = laneOpacity;
                FlxG.save.data.opponentLaneOpacity = opponentLaneOpacity;
// End

		FlxG.save.data.ratingOffset = ratingOffset;
		FlxG.save.data.sickWindow = sickWindow;
		FlxG.save.data.goodWindow = goodWindow;
		FlxG.save.data.badWindow = badWindow;
		FlxG.save.data.safeFrames = safeFrames;
		FlxG.save.data.gameplaySettings = gameplaySettings;
		FlxG.save.data.controllerMode = controllerMode;
	
		FlxG.save.flush();

		var save:FlxSave = new FlxSave();
		save.bind('controls_v2', 'ninjamuffin99'); //Placing this in a separate save so that it can be manually deleted without removing your Score and stuff
		save.data.customControls = keyBinds;
		save.flush();
		FlxG.log.add("Settings saved!");
	}

	public static function loadPrefs() {
		if(FlxG.save.data.downScroll != null) {
			downScroll = FlxG.save.data.downScroll;
		}
		if(FlxG.save.data.middleScroll != null) {
			middleScroll = FlxG.save.data.middleScroll;
		}
		if(FlxG.save.data.showFPS != null) {
			showFPS = FlxG.save.data.showFPS;
			if(Main.fpsVar != null) {
				Main.fpsVar.visible = showFPS;
			}
		}
		if(FlxG.save.data.flashing != null) {
			flashing = FlxG.save.data.flashing;
		}
		if(FlxG.save.data.globalAntialiasing != null) {
			globalAntialiasing = FlxG.save.data.globalAntialiasing;
		}
		if(FlxG.save.data.noteSplashes != null) {
			noteSplashes = FlxG.save.data.noteSplashes;
		}
		if(FlxG.save.data.lowQuality != null) {
			lowQuality = FlxG.save.data.lowQuality;
		}
		if(FlxG.save.data.framerate != null) {
			framerate = FlxG.save.data.framerate;
			if(framerate > FlxG.drawFramerate) {
				FlxG.updateFramerate = framerate;
				FlxG.drawFramerate = framerate;
			} else {
				FlxG.drawFramerate = framerate;
				FlxG.updateFramerate = framerate;
			}
		}
		/*if(FlxG.save.data.cursing != null) {
			cursing = FlxG.save.data.cursing;
		}
		if(FlxG.save.data.violence != null) {
			violence = FlxG.save.data.violence;
		}*/
		if(FlxG.save.data.camZooms != null) {
			camZooms = FlxG.save.data.camZooms;
		}
		if(FlxG.save.data.hideHud != null) {
			hideHud = FlxG.save.data.hideHud;
		}
		if(FlxG.save.data.noteOffset != null) {
			noteOffset = FlxG.save.data.noteOffset;
		}
		if(FlxG.save.data.arrowHSV != null) {
			arrowHSV = FlxG.save.data.arrowHSV;
		}
		if(FlxG.save.data.imagesPersist != null) {
			imagesPersist = FlxG.save.data.imagesPersist;
			FlxGraphic.defaultPersist = ClientPrefs.imagesPersist;
		}
		if(FlxG.save.data.ghostTapping != null) {
			ghostTapping = FlxG.save.data.ghostTapping;
		}
		if(FlxG.save.data.timeBarType != null) {
			timeBarType = FlxG.save.data.timeBarType;
		}
		if(FlxG.save.data.scoreZoom != null) {
			scoreZoom = FlxG.save.data.scoreZoom;
		}
		if(FlxG.save.data.noReset != null) {
			noReset = FlxG.save.data.noReset;
		}
		if(FlxG.save.data.healthBarAlpha != null) {
			healthBarAlpha = FlxG.save.data.healthBarAlpha;
		}
		if(FlxG.save.data.comboOffset != null) {
			comboOffset = FlxG.save.data.comboOffset;
		}

	//My Engine stuff
		//Tabi stuff
		if(FlxG.save.data.tabi != null) {
                        tabi = FlxG.save.data.tabi;
                }
		if(FlxG.save.data.tabiMax != null) {
                        tabiMax = FlxG.save.data.tabiMax;
                }
		// UI stuff
		if(FlxG.save.data.healthCounter != null) {
                        healthCounter = FlxG.save.data.healthCounter;
                }
		if(FlxG.save.data.judgements != null) {
                        judgements = FlxG.save.data.judgements;
                }
		if(FlxG.save.data.songInfo != null) {
			songInfo = FlxG.save.data.songInfo;
                }
		if(FlxG.save.data.scoreType != null) {
                        scoreType = FlxG.save.data.scoreType;
                }
		if(FlxG.save.data.scoreStyle != null) {
                        scoreStyle = FlxG.save.data.scoreStyle;
                }
		if(FlxG.save.data.iconBoping != null) {
                        iconBoping = FlxG.save.data.iconBoping;
                }
		if(FlxG.save.data.detachedCam != null) {
                        detachedCam = FlxG.save.data.detachedCam;
                }
		if(FlxG.save.data.detachedHUD != null) {
			detachedHUD = FlxG.save.data.detachedHUD;
                }
		// Arrow Opacity
		if(FlxG.save.data.arrowOpacity != null) {
                        arrowOpacity = FlxG.save.data.arrowOpacity;
                }
		if(FlxG.save.data.opponentArrowOpacity != null) {
                        opponentArrowOpacity = FlxG.save.data.opponentArrowOpacity;
                }
		// Lane opacity 
		if(FlxG.save.data.laneOpacity != null) {
                        laneOpacity = FlxG.save.data.laneOpacity;
                }
                if(FlxG.save.data.opponentLaneOpacity != null) {
                        opponentLaneOpacity = FlxG.save.data.opponentLaneOpacity;
                }
		// Misc stuff
		if(FlxG.save.data.memoryCounter != null) {
                        memoryCounter = FlxG.save.data.memoryCounter;
                }
		if(FlxG.save.data.antimash != null) {
                        antimash = FlxG.save.data.antimash;
                }
		if(FlxG.save.data.normalCombo != null) {
                        normalCombo = FlxG.save.data.normalCombo;
                }

		if(FlxG.save.data.playHitSound != null) {
                        playHitSound = FlxG.save.data.playHitSound;
                }
		if(FlxG.save.data.sustainhp != null) {
                        sustainhp = FlxG.save.data.sustainhp;
                }
	// End
		if(FlxG.save.data.ratingOffset != null) {
			ratingOffset = FlxG.save.data.ratingOffset;
		}
		if(FlxG.save.data.sickWindow != null) {
			sickWindow = FlxG.save.data.sickWindow;
		}
		if(FlxG.save.data.goodWindow != null) {
			goodWindow = FlxG.save.data.goodWindow;
		}
		if(FlxG.save.data.badWindow != null) {
			badWindow = FlxG.save.data.badWindow;
		}
		if(FlxG.save.data.safeFrames != null) {
			safeFrames = FlxG.save.data.safeFrames;
		}
		if(FlxG.save.data.controllerMode != null) {
			controllerMode = FlxG.save.data.controllerMode;
		}
		if(FlxG.save.data.gameplaySettings != null)
		{
			var savedMap:Map<String, Dynamic> = FlxG.save.data.gameplaySettings;
			for (name => value in savedMap)
			{
				gameplaySettings.set(name, value);
			}
		}
		
		// flixel automatically saves your volume!
		if(FlxG.save.data.volume != null)
		{
			FlxG.sound.volume = FlxG.save.data.volume;
		}
		if (FlxG.save.data.mute != null)
		{
			FlxG.sound.muted = FlxG.save.data.mute;
		}

		var save:FlxSave = new FlxSave();
		save.bind('controls_v2', 'ninjamuffin99');
		if(save != null && save.data.customControls != null) {
			var loadedControls:Map<String, Array<FlxKey>> = save.data.customControls;
			for (control => keys in loadedControls) {
				keyBinds.set(control, keys);
			}
			reloadControls();
		}
	}

	inline public static function getGameplaySetting(name:String, defaultValue:Dynamic):Dynamic {
		return /*PlayState.isStoryMode ? defaultValue : */ (gameplaySettings.exists(name) ? gameplaySettings.get(name) : defaultValue);
	}

	public static function reloadControls() {
		PlayerSettings.player1.controls.setKeyboardScheme(KeyboardScheme.Solo);

		TitleState.muteKeys = copyKey(keyBinds.get('volume_mute'));
		TitleState.volumeDownKeys = copyKey(keyBinds.get('volume_down'));
		TitleState.volumeUpKeys = copyKey(keyBinds.get('volume_up'));
		FlxG.sound.muteKeys = TitleState.muteKeys;
		FlxG.sound.volumeDownKeys = TitleState.volumeDownKeys;
		FlxG.sound.volumeUpKeys = TitleState.volumeUpKeys;
	}

	public static function copyKey(arrayToCopy:Array<FlxKey>):Array<FlxKey> {
		var copiedArray:Array<FlxKey> = arrayToCopy.copy();
		var i:Int = 0;
		var len:Int = copiedArray.length;

		while (i < len) {
			if(copiedArray[i] == NONE) {
				copiedArray.remove(NONE);
				--i;
			}
			i++;
			len = copiedArray.length;
		}
		return copiedArray;
	}
}
