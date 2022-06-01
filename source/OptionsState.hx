package;

import Controls.KeyboardScheme;
import flixel.addons.transition.FlxTransitionableState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class OptionsState extends MusicBeatSubstate
{
	var textMenuItems:Array<String> = [Settings.downscroll ? "Downscroll" : "Upscroll",
	Settings.antialiasing ? "Antialiasing" : "No Antialiasing",
	Settings.dfjk ? "DFJK" : "Arrow Keys"
];
	var curSelected:Int = 0;

	var grpOptionsTexts:FlxTypedGroup<FlxText>;

	public function new()
	{
		super();

		var menuBG:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		menuBG.color = 0x4550f5;
		menuBG.setGraphicSize(Std.int(menuBG.width * 1.1));
		menuBG.updateHitbox();
		menuBG.screenCenter();
		menuBG.antialiasing = Settings.antialiasing;
		add(menuBG);

		grpOptionsTexts = new FlxTypedGroup<FlxText>();
		add(grpOptionsTexts);

		for (i in 0...textMenuItems.length)
		{
			var optionText:FlxText = new FlxText(20, 20 + (i * 50), 0, textMenuItems[i], 32);
            optionText.setFormat(Paths.font("vcr.ttf"), 50, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
 			optionText.borderSize = 1.5;
			optionText.ID = i;
			grpOptionsTexts.add(optionText);
		}
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (controls.UP_P)
			curSelected -= 1;

		if (controls.DOWN_P)
			curSelected += 1;

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
						

						case "DFJK" | "Arrow Keys":
						Settings.dfjk = !Settings.dfjk;
						Settings.saveOptions();
						textMenuItems[2] = Settings.dfjk ? "DFJK" : "Arrow Keys"; 
						grpOptionsTexts.members[2].text = textMenuItems[2];
						if (Settings.dfjk)
							controls.setKeyboardScheme(KeyboardScheme.Solo, true);
						else
							controls.setKeyboardScheme(KeyboardScheme.Duo(true), true);
			}
		}

		if (controls.BACK)
			{
				FlxG.sound.play(Paths.sound('cancelMenu'));
				FlxG.switchState(new MainMenuState());
			}
	}
}
