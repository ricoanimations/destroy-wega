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
	var randomNumberA = FlxG.random.int(0, 1050);
	var randomNumberB = FlxG.random.int(0, 475);
	var time:Int = 117;
	var timeText:FlxText;
	var scream:FlxSound;
	var bigWega:FlxSprite;
	var randomNumberC = FlxG.random.int(0, 1);
	var randomNumberD = FlxG.random.int(0, 1);

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
		bigWega.loadGraphic("assets/images/scream.png");
		bigWega.screenCenter();
		bigWega.alpha = 0;
		add(bigWega);

		text = new FlxText();
		text.text = 'WEGAS DESTROYED: ${number}';
		text.size = 48;
		text.screenCenter(X);
		text.y = FlxG.height / 12;
		add(text);

		timeText = new FlxText();
		timeText.text = '${time}';
		timeText.size = 48;
		timeText.x = FlxG.width / 12;
		timeText.y = FlxG.height / 12;
		add(timeText);
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
		var randomNumberX = FlxG.random.int(0, 1050);
		var randomNumberY = FlxG.random.int(0, 475);
		jumpscare();
		playdaScream();
		wega = new FlxSprite();
		wega.loadGraphic("assets/images/wega.png");
		wega.x = randomNumberX;
		wega.y = randomNumberY;
		add(wega);
		wegaMove();
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
		FlxG.camera.shake();
	}

	function wegaMove()
	{
		if (randomNumberC == 0)
		{
			wega.velocity.x *= 1;
		}
		else
		{
			wega.velocity.x *= -1;
		}

		if (randomNumberD == 0)
		{
			wega.velocity.y *= 1;
		}
		else
		{
			wega.velocity.y *= -1;
		}
	}

	function alsocountdown(_):Void
	{
		new FlxTimer().start(1, function(countthedown:FlxTimer)
		{
			time--;
			remove(timeText);
			timeText = new FlxText();
			timeText.text = '${time}';
			timeText.size = 48;
			timeText.x = FlxG.width / 12;
			timeText.y = FlxG.height / 12;
			add(timeText);
		});
	}
}