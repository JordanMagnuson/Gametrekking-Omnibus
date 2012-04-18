package killer.rooms 
{
	import flash.utils.Dictionary;
	import killer.game.EndScreen02;
	import killer.game.FadeIn;
	import menu.CambodiaLanding;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Screen;
	import net.flashpunk.Sfx;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import killer.game.Global;
	import net.flashpunk.utils.Key;
	import net.flashpunk.utils.Input;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import flash.ui.Mouse;
	import killer.Assets;
	import punk.transition.Transition;
	
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class GameOver extends World
	{
		public var request:URLRequest;
		public var learnMoreGameTrekkingCambodiaURL:String = "http://www.gametrekking.com/blog/cambodia-like-no-place-ive-been?utm_source=airapp&utm_medium=desktop&utm_campaign=gametrekkingomnibus";
		public var learnMoreKillingFieldsURL:String = "http://en.wikipedia.org/wiki/The_killing_fields";
		public var learnMoreCambodiaURL:String = "http://en.wikipedia.org/wiki/Cambodia";
		public var leaveCommentURL:String = "http://www.gametrekking.com/comment/reply/58#comment-form?utm_source=airapp&utm_medium=desktop&utm_campaign=gametrekkingomnibus";
		
		public function GameOver() 
		{
			(FP.engine as Main).reset(SuperGlobal.SCREEN_WIDTH, SuperGlobal.SCREEN_HEIGHT, 60, false);
			//FP.width = SuperGlobal.SCREEN_WIDTH;
			//FP.height = SuperGlobal.SCREEN_HEIGHT;
			//FP.screen = new Screen();	
		}
		
		override public function begin():void
		{
			FP.rate = 0.4;
			add(new FadeIn(Colors.BLACK, 6));
			//Global.exploded = true;
			if (Global.mercifulShot)
				add(new Entity(0, 0, new Image(Assets.END_SCREEN_01_MERCY)));
			else if (Global.exploded)
				add(new Entity(0, 0, new Image(Assets.END_SCREEN_01_EXPLOSION)));
			else
				add(new Entity(0, 0, new Image(Assets.END_SCREEN_01_KILLER)));				
		}
		
		override public function update():void
		{
			//if (Global.endScreenFades == 1 && Input.mouseReleased)
			//{
				//add(new EndScreen02);
			//}
			
			// Return to menu
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
				punk.transition.Transition.to(CambodiaLanding, new SuperGlobal.TRANS_OUT(SuperGlobal.TRANS_OUT_OPTIONS), new SuperGlobal.TRANS_IN(SuperGlobal.TRANS_IN_OPTIONS));
				//FP.world = new VietnamLanding;
			}							
			
			//if (Global.endScreen >= 2 && Input.pressed(Key.SPACE))
			//{  
				//request = new URLRequest(learnMoreGameTrekkingCambodiaURL);
				//try {
				  //navigateToURL(request, '_blank'); // second argument is target
				//} catch (e:Error) {
				  //trace("Error occurred!");
				//}
			//}
			//if (Global.endScreen >= 2 && Input.pressed(Key.X))
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