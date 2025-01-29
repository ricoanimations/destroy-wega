package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;

class MainMenuState extends FlxState
{
    var bg:FlxSprite;
    var enter:FlxSprite;
    var text:FlxText;
    var wega:FlxText;

	override public function create()
	{
		super.create();

        bg = new FlxSprite();
        bg.makeGraphic(1280, 720, 0xFF808080);
        add(bg);

        enter = new FlxSprite();
        enter.makeGraphic(128, 72, 0xFF00FF00);
        enter.screenCenter();
        add(enter);

        text = new FlxText();
        text.text = 'ENTER';
        text.size = 24;
        text.screenCenter();
        add(text);

        wega = new FlxText();
        wega.text = 'destroy wega';
        wega.size = 48;
        wega.screenCenter(X);
        wega.y = FlxG.height / 4;
        add(wega);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

        if (FlxG.mouse.overlaps(enter))
        {
            enter.alpha = 0.5;
            text.alpha = 0.5;
            if (FlxG.mouse.justPressed)
            {
                FlxG.switchState(new PlayState());
            }
        }
        else if (!FlxG.mouse.overlaps(enter))
        {
            enter.alpha = 1;
            text.alpha = 0;
        }
	}
}
