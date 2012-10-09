package statusquo  
{
	import flash.net.URLRequest;
	import flash.utils.Dictionary;
	import menu.TaiwanLanding;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.Sfx;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import flash.net.navigateToURL;
	import menu.Global;
	import punk.transition.Transition;
	
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class GameOverWorld extends World
	{
		
		//[Embed(source = '../../assets/statusquo/CasualEncounter.ttf', embedAsCFF = "false", fontFamily = 'CasualEncounter')] private var CasualEncounter:Class;		
		//[Embed(source = '../../assets/statusquo/verdana.ttf', embedAsCFF = "false", fontFamily = 'verdana')] private var Verdana:Class;	
		
		[Embed(source = '../../assets/statusquo/ch_lasted.png')] private const CH_LASTED:Class;
		public var chLasted:Image = new Image(CH_LASTED);
		
		[Embed(source = '../../assets/statusquo/ch_absorbed.png')] private const CH_ABSORBED:Class;
		public var chAbsorbed:Image = new Image(CH_ABSORBED);	
		
		[Embed(source = '../../assets/statusquo/ch_destroyed.png')] private const CH_DESTROYED:Class;
		public var chDestroyed:Image = new Image(CH_DESTROYED);			
		
		[Embed(source = '../../assets/statusquo/ch_press_space.png')] private const CH_PRESS:Class;
		public var chPress:Image = new Image(CH_PRESS);				
		
		public var learnMoreURL:String = "http://www.gametrekking.com/about-taiwan?utm_source=airapp&utm_medium=desktop&utm_campaign=gametrekkingomnibus";
		
		public function GameOverWorld() 
		{
			// Get minutes and seconsd alive, format strings.
			var minutesAlive:int = Math.floor(Globals.timeAlive / 60);
			var secondsAlive:int = Math.floor(Globals.timeAlive % 60);
			var minutesAliveString:String;
			var secondsAliveString:String;
			if (minutesAlive > 0)
			{
				if (minutesAlive == 1) minutesAliveString = '1 minute';
				else minutesAliveString = String(minutesAlive) + ' minutes';
			}
			if (secondsAlive == 1) secondsAliveString = '1 second';
			else secondsAliveString = String(secondsAlive) + ' seconds';
			
			// Mode of death
			var modeOfDeathString:String;
			if (Globals.modeOfDeath == 'absorbed')
				modeOfDeathString = "before getting too close to and being absorbed by a larger circle."
			else
				modeOfDeathString = "before antagonizing and being destroyed by a larger circle."
			
			// Print text to screen
			if (minutesAlive > 0)
				add(new TextEntity("You managed to keep the status quo for " + minutesAliveString + " and " + secondsAliveString + ",", FP.halfWidth, FP.halfHeight - 95));
			else
				add(new TextEntity("You managed to keep the status quo for " + secondsAliveString + ", ", FP.halfWidth, FP.halfHeight - 95));
		
			add(new TextEntity(modeOfDeathString, FP.halfWidth, FP.halfHeight - 65));
				
			add(new TextEntity("Press R to try again.", FP.halfWidth, FP.halfHeight + 35));
			
			add(new TextEntity("Press X to learn about how this game applies to Taiwan.", FP.halfWidth, FP.halfHeight + 65));
			
			add(new TextEntity("Press Esc to return to the menu.", FP.halfWidth, FP.halfHeight + 95));
			
			// Chinese text
			trace(Globals.timeAlive);
			if (Globals.modeOfDeath == 'absorbed')
			{
				add(new Entity(FP.halfWidth - chAbsorbed.width / 2, 112, chAbsorbed));
			}
			else
			{
				add(new Entity(FP.halfWidth - chDestroyed.width / 2, 112, chDestroyed));
			}
			add(new TextEntity(String(int(Globals.timeAlive)), FP.halfWidth + 8, 138, false));
			add(new Entity(FP.halfWidth - chLasted.width / 2, 140, chLasted));			
			add(new Entity(FP.halfWidth - chPress.width / 2, 463, chPress));
		}
		
		override public function begin():void
		{
			add(new FadeIn);
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
				Transition.to(TaiwanLanding, new menu.Global.TRANS_OUT(menu.Global.TRANS_OUT_OPTIONS), new menu.Global.TRANS_IN(menu.Global.TRANS_IN_OPTIONS));
			}					
			
			if (Input.pressed(Key.R))
			{
				FP.world = new GameWorld;
			}
			if (Input.pressed(Key.X))
			{
				FP.world = new Explanation;
				//var request:URLRequest = new URLRequest(learnMoreURL);
				//try {
				  //navigateToURL(request, '_blank'); // second argument is target
				//} catch (e:Error) {
				  //trace("Error occurred!");
				//}
			}
			super.update();
		}
	}

}