package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.util.FlxTimer;
import flixel.sound.FlxSound;
import flixel.tweens.FlxTween;

class PlayState extends FlxState
{
	var bg:FlxSprite;
	var number:Int = 0;
	var text:FlxText;
	var wega:FlxSprite;
	var randomNumberA = FlxG.random.int(0, 1180);
	var randomNumberB = FlxG.random.int(0, 620);
	var time:Int = 60;
	var scream:FlxSound;
	var bigWega:FlxSprite;

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
		
		bigWega = new FlxSprite();
		bigWega.loadGraphic("assets/images/wega.png");
		bigWega.screenCenter();
		bigWega.scale.set(3, 3);
		bigWega.alpha = 0;
		add(bigWega);

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

		playdaMusic();

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
		jumpscare();
		playdaScream();
		wega = new FlxSprite();
		wega.loadGraphic("assets/images/wega.png");
		wega.x = randomNumberX;
		wega.y = randomNumberY;
		add(wega);
	}

	function playdaMusic()
	{
		if (FlxG.sound.music == null)
		{
			FlxG.sound.playMusic("assets/music/iason-mason.ogg", 1, true);
		}
	}

	function playdaScream()
	{
		scream = FlxG.sound.load("assets/sounds/scream.ogg");
		scream.play();
	}

	function jumpscare()
	{
		bigWega.alpha = 1;
		FlxTween.tween(bigWega, {alpha: 0}, 0.5);
	}
}