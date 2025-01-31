package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;

class CreditsState extends FlxState
{
    var bg:FlxSprite;
    var pfp:FlxSprite;
    var text:FlxText;
    var btext:FlxText;
    var exit:FlxSprite;
    var etext:FlxText;

    override public function create():Void
    {
    	super.create();

        bg = new FlxSprite();
        bg.loadGraphic("assets/images/menu.png");
        add(bg);

        pfp = new FlxSprite();
        pfp.loadGraphic("assets/images/rico.png");
        pfp.x = FlxG.width / 12;
        pfp.screenCenter(Y);
        add(pfp);

        btext = new FlxText();
        btext.text = "supernovaexplosion64";
        btext.size = 48;
        btext.font = "assets/fonts/comic.ttf";
        btext.x = FlxG.width / 2;
        btext.y = pfp.y;
        add(btext);

        text = new FlxText();
        text.text = "doo doo, wet fart\n\nalso thanks for kenny l for making iason mason";
        text.size = 32;
        text.font = "assets/fonts/comic.ttf";
        text.x = btext.x;
        text.y = btext.y + btext.height + 20;
        add(text);

        exit = new FlxSprite();
        exit.makeGraphic(64, 64, 0xFFFF0000);
        exit.x = (FlxG.width / 12) * 11;
        exit.y = FlxG.height / 12;
        add(exit);

        etext = new FlxText();
        etext.text = "exit";
        etext.size = 18;
        etext.font = "assets/fonts/comic.ttf";
        etext.x = exit.x + ((exit.width / 2) - (etext.width / 2));
        etext.y = exit.y + ((exit.height / 2) - (etext.height / 2));
        add(etext);
    }

    override public function update(elapsed:Float):Void
    {
    	super.update(elapsed);

        if (FlxG.mouse.overlaps(exit))
        {
            FlxTween.tween(exit, {alpha: 0.5}, 0.5, {ease: FlxEase.linear});
            FlxTween.tween(etext, {alpha: 0.5}, 0.5, {ease: FlxEase.linear});

            if (FlxG.mouse.justPressed)
            {
                FlxG.switchState(new MainMenuState());
            }
        }
        else if (!FlxG.mouse.overlaps(exit))
        {
            FlxTween.tween(exit, {alpha: 1}, 0.5, {ease: FlxEase.linear});
            FlxTween.tween(etext, {alpha: 1}, 0.5, {ease: FlxEase.linear});
        }
    }
}