package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;

class MainMenuState extends FlxState
{
    var bg:FlxSprite;
    var enter:FlxSprite;
    var credits:FlxSprite;
    var warning:FlxText;
    var text:FlxText;
    var textcredits:FlxText;
    var wega:FlxText;

	override public function create()
	{
		super.create();

        bg = new FlxSprite();
        bg.loadGraphic("assets/images/menu.png");
        add(bg);

        enter = new FlxSprite();
        enter.makeGraphic(128, 72, 0xFF00FF00);
        enter.screenCenter();
        add(enter);

        credits = new FlxSprite();
        credits.makeGraphic(128, 72, 0xFF00FF00);
        credits.screenCenter(X);
        credits.y = enter.y + enter.height + 12;
        add(credits);

        text = new FlxText();
        text.text = 'ENTER';
        text.font = "assets/fonts/comic.ttf";
        text.size = 24;
        text.screenCenter();
        add(text);

        textcredits = new FlxText();
        textcredits.text = 'CREDITS';
        textcredits.font = "assets/fonts/comic.ttf";
        textcredits.size = 18;
        textcredits.x = credits.x + ((credits.width / 2) - (textcredits.width / 2));
        textcredits.y = credits.y + ((credits.height / 2) - (textcredits.height / 2));
        add(textcredits);

        wega = new FlxText();
        wega.text = 'destroy wega';
        wega.font = "assets/fonts/comic.ttf";
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
            FlxTween.tween(enter, {alpha: 0.5}, 0.5);
            FlxTween.tween(text, {alpha: 0.5}, 0.5);

            if (FlxG.mouse.justPressed)
            {
                FlxG.switchState(new PlayState());
            }
        }
        else if (!FlxG.mouse.overlaps(enter))
        {
            FlxTween.tween(enter, {alpha: 1}, 0.5);
            FlxTween.tween(text, {alpha: 1}, 0.5);
        }

        if (FlxG.mouse.overlaps(credits))
        {
            FlxTween.tween(credits, {alpha: 0.5}, 0.5);
            FlxTween.tween(textcredits, {alpha: 0.5}, 0.5);

            if (FlxG.mouse.justPressed)
            {
                FlxG.switchState(new CreditsState());
            }
        }
        else if (!FlxG.mouse.overlaps(credits))
        {
            FlxTween.tween(enter, {alpha: 1}, 0.5);
            FlxTween.tween(text, {alpha: 1}, 0.5);
        }
	}
}
