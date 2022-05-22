package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class OptionsSubState extends MusicBeatSubstate
{
	var textMenuItems:Array<String> = [Settings.downscroll ? "Downscroll" : "Upscroll", Settings.antialiasing ? "Antialiasing" : "No Antialiasing"];

	var selector:FlxSprite;
	var curSelected:Int = 0;

	var grpOptionsTexts:FlxTypedGroup<FlxText>;

	public function new()
	{
		super();

		grpOptionsTexts = new FlxTypedGroup<FlxText>();
		add(grpOptionsTexts);

		selector = new FlxSprite().makeGraphic(5, 5, FlxColor.RED);
		selector.alpha = 0;
		add(selector);

		for (i in 0...textMenuItems.length)
		{
			var optionText:FlxText = new FlxText(20, 20 + (i * 50), 0, textMenuItems[i], 32);
			optionText.ID = i;
			grpOptionsTexts.add(optionText);
		}
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (controls.UP_P)
			curSelected -= 1;
			FlxG.sound.play(Paths.sound('scrollMenu'));

		if (controls.DOWN_P)
			curSelected += 1;
			FlxG.sound.play(Paths.sound('scrollMenu'));

		if (curSelected < 0)
			curSelected = textMenuItems.length - 1;

		if (curSelected >= textMenuItems.length)
			curSelected = 0;

		grpOptionsTexts.forEach(function(txt:FlxText)
		{
			txt.color = FlxColor.WHITE;

			if (txt.ID == curSelected)
				txt.color = FlxColor.YELLOW;
		});

		if (controls.ACCEPT)
		{
			switch (textMenuItems[curSelected])
			{
				case "Downscroll" | "Upscroll":
						Settings.downscroll = !Settings.downscroll;
						Settings.saveOptions();
						textMenuItems[0] = Settings.downscroll ? "Downscroll" : "Upscroll"; 
						grpOptionsTexts.members[0].text = textMenuItems[0];


						case "Antialiasing" | "No Antialiasing":
						Settings.antialiasing = !Settings.antialiasing;
						Settings.saveOptions();
						textMenuItems[1] = Settings.antialiasing ? "Antialiasing" : "No Antialiasing"; 
						grpOptionsTexts.members[1].text = textMenuItems[1];
			}
		}

		if (controls.BACK)
			{
				FlxG.sound.play(Paths.sound('cancelMenu'));
				FlxG.switchState(new MainMenuState());
			}
	}
}