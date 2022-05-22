package;

import flixel.FlxSprite;

class HealthIcon extends FlxSprite
{

	public var sprTracker:FlxSprite;

	var player = PlayState.SONG.player1;
	var opponent = PlayState.SONG.player2;
	
	public function new(char:String = 'bf', isPlayer:Bool = false)
	{
		super();
		antialiasing = true;

		if (isPlayer == true) {
			loadGraphic(Paths.image('icon-' + player), true, 150, 150);
			animation.add(player, [0, 1], 0, false, true);
			animation.play(char);
		} else {
			loadGraphic(Paths.image('icon-' + opponent), true, 150, 150);
			animation.add(opponent, [0, 1], 0, false, false);
			animation.play(char);
		}
		scrollFactor.set();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);
	}
}
