package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.util.FlxTimer;
import flixel.sound.FlxSound;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import Std;

class PlayState extends FlxState
{
	var bg:FlxSprite;
	var number:Int = 0;
	var text:FlxText;
	var wega:FlxSprite;
	var randomNumberA = FlxG.random.int(0, 1050);
	var randomNumberB = FlxG.random.int(0, 475);
	var time:Int;
	var score:Int = 0;
	var addingUp:Int = 750;
	var addingDown:Int = 100;
	var scoreText:FlxText;
	var timeText:FlxText;
	var scream:FlxSound;
	var bigWega:FlxSprite;
	var randomNumberC = FlxG.random.int(0, 1);
	var randomNumberD = FlxG.random.int(0, 1);

	override public function create()
	{
		super.create();

		bg = new FlxSprite();
        bg.loadGraphic("assets/images/playstate.png");
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
		text.font = "assets/fonts/comic.ttf";
		text.size = 48;
		text.screenCenter(X);
		text.y = FlxG.height / 12;
		add(text);

		scoreText = new FlxText();
		scoreText.text = "SOMARI'S SCORE:" + Std.string(score);
		scoreText.font = "assets/fonts/comic.ttf";
		scoreText.size = 48;
		scoreText.screenCenter(X);
		scoreText.y = text.y + text.width + 12;
		add(scoreText);

		timeText = new FlxText();
		timeText.text = '${time}';
		timeText.font = "assets/fonts/comic.ttf";
		timeText.size = 48;
		timeText.x = FlxG.width / 12;
		timeText.y = FlxG.height / 12;
		add(timeText);

		FlxG.sound.playMusic("assets/music/iason-mason.ogg", 1, true);

		time = Std.int(FlxG.sound.music.length / 1000);

		FlxTween.num(time, 0, time, {ease: FlxEase.linear}, updateValue);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		endDaGame();

		if (FlxG.mouse.overlaps(wega))
		{
			if (FlxG.mouse.justPressed)
			{
				remove(wega);
				number++;
				text.text = 'WEGAS DESTROYED: ${number}';
				addWega();
				scoreChange();
			}
		}

		if (FlxG.mouse.justPressed && !FlxG.mouse.overlaps(wega) && !(FlxG.mouse.screenX >= wega.x && FlxG.mouse.screenX <= wega.x + wega.width) && !(FlxG.mouse.screenY >= wega.y && FlxG.mouse.screenY <= wega.y + wega.height))
		{
			scoreChangeBad();
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

	private function updateValue(value:Float):Void
	{
		timeText.text = Std.string(Std.int(value));
	}

	function endDaGame()
	{
		new FlxTimer().start(time, function(endDaGame:FlxTimer)
		{
			FlxG.switchState(new ScoreState());
		});
	}

	function scoreChange()
	{
		score += addingUp;
		addingUp = Std.int(addingUp * 1.01);
		scoreText.text = "SOMARI'S SCORE:" + Std.string(score);
	}

	function scoreChangeBad()
	{
		score -= addingDown;
		addingDown = Std.int(addingDown * 1.02);
		scoreText.text = "SOMARI'S SCORE:" + Std.string(score);
	}
}