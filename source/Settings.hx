package;

import flixel.FlxG;
import flixel.util.FlxSave;
import flixel.input.keyboard.FlxKey;

class Settings {
	public static var downscroll:Bool = false;
	public static var antialiasing:Bool = true;

	public static function saveOptions() {
		FlxG.save.data.downscroll = downscroll;
		FlxG.save.data.antialiasing = antialiasing;
		FlxG.save.flush();
	}

	public static function loadOptions() {
		if(FlxG.save.data.downScroll != null) {
			downscroll = FlxG.save.data.downscroll;
		}
		if(FlxG.save.data.antialiasing != null) {
			antialiasing = FlxG.save.data.antialiasing;
		}
	}
}