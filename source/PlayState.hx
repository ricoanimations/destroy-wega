package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.util.FlxTimer;

class PlayState extends FlxState
{
	var bg:FlxSprite;
	var number:Int = 0;
	var text:FlxText;
	var wega:FlxSprite;
	var randomNumberA = FlxG.random.int(0, 1280);
	var randomNumberB = FlxG.random.int(0, 720);

	override public function create()
	{
		super.create();

		bg = new FlxSprite();
        bg.makeGraphic(1280, 720, 0xFF808080);
        add(bg);

		wega = new FlxSprite();
		wega.loadGraphic("assets/images/wega.png");
		wega.x = randomNumberA;
		wega.y = randomNumberB;
		add(wega);

		text = new FlxText();
		text.text = 'WEGAS DESTROYED: ${number}';
		text.size = 48;
		text.screenCenter(X);
		text.y = FlxG.height / 12;
		add(text);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.mouse.overlaps(wega))
		{
			if (FlxG.mouse.justPressed)
			{
				remove(wega);
				number++;
				text.text = 'WEGAS DESTROYED: ${number}';
				addWega();
			}
		}
	}

	function addWega()
	{
		var randomNumberX = FlxG.random.int(0, 1280);
		var randomNumberY = FlxG.random.int(0, 720);
		wega = new FlxSprite();
		wega.loadGraphic("assets/images/wega.png");
		wega.x = randomNumberX;
		wega.y = randomNumberY;
		add(wega);
	}
}