package;

import flixel.FlxSprite;

using StringTools;

class HealthIcon extends FlxSprite
{
	public var char:String;
	public var isPlayer:Bool;

	public var sprTracker:FlxSprite;

	public function new(char:String, ?isPlayer:Bool = false)
	{
		super();

		this.char = char;
		this.isPlayer = isPlayer;

		changeIcon(char);
		antialiasing = true;
		scrollFactor.set();
	}

	public function changeIcon(char:String)
	{
		if (char != 'bf-pixel')
			char = char.split("-")[0];

		loadGraphic(Paths.image('icons/icon-' + char), true, 150, 150);
		animation.add(char, [0, 1], 0, false, isPlayer);
		animation.play(char);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);
	}
}