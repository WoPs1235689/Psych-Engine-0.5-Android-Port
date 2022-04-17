package options;

#if desktop
import Discord.DiscordClient;
#end
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;
import flixel.FlxSubState;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxSave;
import haxe.Json;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;
import flixel.input.keyboard.FlxKey;
import flixel.graphics.FlxGraphic;
import Controls;

using StringTools;

class ReGameplaySettingsSubState extends BaseOptionsMenu
{
	public function new()
	{
		title = 'Gameplay';
		rpcTitle = 'Gameplay Settings Menu'; //for Discord Rich Presence

		var option:Option = new Option('Antimash', 
			'If unchecked, disables antimash.', 
			'antimash', 
			'bool', 
			true); 
		addOption(option);

		var option:Option = new Option('Sustain Hp',
                        'If unchecked, disables hp gained from sustains.',
                        'sustainhp',
                        'bool',
                        true);
                addOption(option);
		
		var option:Option = new Option('Moving HP bar',
                        'if checked makes the bar move with the extra hp.',
                        'tabi',
                        'bool',
                        false);
                addOption(option);

                var option:Option = new Option('HP',
                        "How much hp you want",
                        'tabiMax',
                        'int',
                        2);
                addOption(option);
                option.minValue = 2;
                option.maxValue = 300;
                option.displayFormat = '%v MAX';
	
		super();
	}
}
