package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;

class CreditsState extends FlxState
{
    var bg:FlxSprite;
    var pfp:FlxSprite;
    var text:FlxText;
    var btext:FlxText;

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
        text.text = "doo doo, wet fart";
        text.size = 32;
        text.font = "assets/fonts/comic.ttf";
        text.x = btext.x;
        text.y = btext.y + btext.height + 20;
        add(text);
    }

    override public function update(elapsed:Float):Void
    {
    	super.update(elapsed);
    }
}