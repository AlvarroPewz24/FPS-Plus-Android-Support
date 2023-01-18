package title;

import flixel.FlxG;
import flixel.FlxState;
import flixel.util.FlxColor;
import hxcodec.VideoHandler;

using StringTools;

class TitleVideo extends FlxState
{
	override public function create():Void
	{
		super.create();

		Paths.music("klaskiiLoop");

		if (!Main.novid)
		{
			var video:VideoHandler = new VideoHandler();
			video.finishCallback = next;
			video.playVideo(SUtil.getStorageDirectory() + Paths.video('klaskiiTitle'));
		}
		else
		{
			next();
		}
	}

	function next():Void
	{
		FlxG.camera.flash(FlxColor.WHITE, 60);
		FlxG.sound.playMusic(Paths.music("klaskiiLoop"), 0.75);
		Conductor.changeBPM(158);
		FlxG.switchState(new TitleScreen());
	}
}
