package;

import flixel.FlxSprite;

class HealthIcon extends FlxSprite
{

	public var sprTracker:FlxSprite;
	public var isPlayer:Bool;
	
	public function new(char:String = 'bf', isPlayer:Bool = false)
	{
		super();
		if (char != 'bf-pixel' && char != 'bf-old') {
			char = char.split("-")[0]; }
			loadGraphic(Paths.image('icon-' + char), true, 150, 150);
			animation.add(char, [0, 1], 0, false, isPlayer);
			animation.play(char);
			antialiasing = Settings.antialiasing;
			scrollFactor.set();
	}

	public function changeIcon(char:String)
		{
			if (char != 'bf-pixel' && char != 'bf-old')
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
