package;

import flixel.FlxSprite;

class HealthIcon extends FlxSprite
{
	/**
	 * Used for FreeplayState! If you use it elsewhere, prob gonna annoying
	 */
	public var sprTracker:FlxSprite;

	var player = PlayState.SONG.player1;
	var opponent = PlayState.SONG.player2;
	
	public function new(char:String = 'bf', isPlayer:Bool = false)
	{
		super();
		loadGraphic(Paths.image('icon-' + player), true, 150, 150);
		loadGraphic(Paths.image('icon-' + opponent), true, 150, 150);

		antialiasing = true;
		animation.add(player, [0, 1], 0, false, isPlayer);
		animation.add(opponent, [0, 1], 0, false, isPlayer);
		animation.play(char);
		scrollFactor.set();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);
	}
}
