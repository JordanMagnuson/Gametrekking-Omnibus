package heartattack  
{
	import flash.net.URLRequest;
	import flash.utils.Dictionary;
	import menu.VietnamLanding;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Sfx;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Key;
	import net.flashpunk.utils.Input;
	import flash.net.navigateToURL;
	import flash.ui.Mouse;
	
	
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class GameOver extends World
	{
		public var gameOverText:EntityFader;
		
		public var request:URLRequest;
		public var learnMoreURL:String = "http://www.gametrekking.com/category/tags/vietnam";
		public var leaveCommentURL:String = "http://www.gametrekking.com/comment/reply/65#comment-form";		
		
		public function GameOver() 
		{
			gameOverText = new EntityFader(0, 0, new Image(Assets.END_SCREEN));
			FP.screen.color = Colors.BLACK;
			
			// Reset the engine to fixed frame rate
			//(FP.engine as Main).reset(640, 480, 60, true);			
			
			// Center screen in window
			FP.screen.x = Global.screenX;
			FP.screen.y = Global.screenY;			
		}
		
		override public function begin():void
		{
			FP.alarm(3 * FP.assignedFrameRate, fadeIn);
		}
		
		public function fadeIn():void
		{
			add(gameOverText);
			gameOverText.fadeIn(10 * FP.assignedFrameRate);			
		}
		
		override public function update():void
		{
			// Return to menu
			if (Input.pressed(SuperGlobal.RETURN_KEY)) 
			{
				// Clear tweens (eg fading sounds, FP.alarm, etc.)
				FP.tweener.clearTweens();
				
				// Stop all sounds
				for each (var sfx:Sfx in SuperGlobal.soundsPlaying) {
					trace('another sound');
					if (sfx != null) sfx.stop();
				}		
				
				// Empty sound tracker
				SuperGlobal.soundsPlaying = new Dictionary();
				
				// Return
				//punk.transition.Transition.to(VietnamLanding, new SuperGlobal.TRANS_OUT(SuperGlobal.TRANS_OUT_OPTIONS), new SuperGlobal.TRANS_IN(SuperGlobal.TRANS_IN_OPTIONS));
				FP.world = new VietnamLanding;
			}			
			
			//if (Input.pressed(Key.SPACE))
			//{  
				//request = new URLRequest(learnMoreURL);
				//try {
				  //navigateToURL(request, '_blank'); // second argument is target
				//} catch (e:Error) {
				  //trace("Error occurred!");
				//}
			//}
			//if (Input.pressed(Key.X))
			//{
				//request = new URLRequest(leaveCommentURL);
				//try {
				  //navigateToURL(request, '_blank'); // second argument is target
				//} catch (e:Error) {
				  //trace("Error occurred!");
				//}
			//}
			super.update();
		}				
		
	}

}