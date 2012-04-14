package statusquo  
{
	import flash.utils.Dictionary;
	import menu.TaiwanLanding;
	import net.flashpunk.Sfx;
	import net.flashpunk.tweens.misc.Alarm;
	import net.flashpunk.tweens.misc.ColorTween;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import menu.Global;
	import punk.transition.Transition;
	
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class GameWorld extends World
	{	
		public static var gameOver:Boolean = false;
		public var fadeStarted:Boolean = false;
		public static var player:Player;
		public static var china:China;
		public static var enemyController:EnemyController;
		public static var timingController:TimingController;
		public static var safeZone:SafeZone;
		import flash.ui.Mouse;
		
		// keeps track of how long the player is alive
		public static var timer:TimeCounter;
		
		public function GameWorld() 
		{
			gameOver = false;
			add(china = new China);
			China.radius = China.RADIUS_ORIG;
			add(safeZone = new SafeZone);
			SafeZone.breathing = false;
			SafeZone.innerRadius = SafeZone.INNER_RADIUS_ORIG;
			SafeZone.outerRadius = SafeZone.OUTER_RADIUS_ORIG;
			add(new LightTail);
			LightTail.moving = false;
			LightTail.speed = LightTail.MIN_SPEED;
			LightTail.angle = 90;
			LightTail.rotations = 0;
			add(player = new Player);
			Player.frozen = true;
			Player.canMove = true;
			add(enemyController = new EnemyController);
			EnemyController.releaseRate = EnemyController.MAX_RELEASE_RATE;
			trace('enemy controller release rate: ' + EnemyController.releaseRate);
			add(new SoundController);
			add(timer = new TimeCounter);
			add(timingController = new TimingController);
			FP.screen.color = Colors.BLACK;
			Mouse.hide();
		}
		
		override public function update():void
		{
			//trace(timer.minutesPassed + ':' + timer.secondsPassed);
			if (gameOver && !fadeStarted)
			{
				fadeStarted = true;
				add(new FadeOut(GameOverWorld));
			}
			
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
			
			super.update();
		}		
		
	}

}