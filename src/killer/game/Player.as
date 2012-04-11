package killer.game
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	import net.flashpunk.Sfx;
	import killer.rooms.MyWorld;
	import killer.SoundController;
	
	public class Player extends Entity
	{
		
		public const PUSH_DISTANCE:Number = 10;
		
		/**
		 * Player speed determines how fast items approach,
		 * as well as animation speed. 100 is normal.
		 */
		public var animSpeed:Number;
		
		public var walking:Boolean = false;
		
		public var canPush:Boolean = true;
		
		/**
		 * Player graphic
		 */
		[Embed(source='../../../assets/killer/killer.png')] private const KILLER:Class;
		public var spritemap:Spritemap = new Spritemap(KILLER, 20, 20);			
		
		/**
		 * Sound
		 */
		[Embed(source='../../../assets/killer/sounds.swf', symbol='walking.wav')] private const SND_WALKING:Class;
		public var sndWalking:Sfx = new Sfx(SND_WALKING);			
		
		[Embed(source='../../../assets/killer/killer_sounds.swf', symbol='push_01_50941.wav')] private const SND_PUSH:Class;
		public var sndPush:Sfx = new Sfx(SND_PUSH);
		
		public function Player() 
		{
			// Graphic
			spritemap.add("stand", [0], 20, false);
			animSpeed = Global.WALKING_SPEED / 10;
			spritemap.add("push", [0, 1, 2, 3], animSpeed * 0.8, false);
			spritemap.add("walk", [4, 5, 6, 7], animSpeed, true);
			spritemap.add("standing_push", [8, 9, 10, 11], animSpeed * 0.8, false);
			graphic = spritemap;
			spritemap.play("stand");
			
			// Hit box
			spritemap.originX = 0;
			spritemap.originY = spritemap.height;
			spritemap.x = 0;
			//spritemap.y = -spritemap.originY;	
			
			setHitbox(spritemap.width, spritemap.height, spritemap.originX, spritemap.originY);				
			
			// Location
			x = 50;
			y = Ground.y;
			
			// Input
			Input.define("X", Key.SPACE);
		}
		
		override public function update():void 
		{
			//trace('current anim:' + spritemap.currentAnim);
			super.update();
			if (Global.playSounds && walking && !sndWalking.playing)
			{
				sndWalking.loop(1);
			}
			else if (!Global.playSounds)
			{
				sndWalking.stop();
			}
			
			if (Input.check("X"))
			{
				if (Global.exploded)
				{
					walking = false;
					return;
				}
				if (!Global.startedWalking)
				{
					Global.timeCounter.started = true;
					//(FP.world as MyWorld).soundController.currentSound.stop();
					//FP.world.remove((FP.world as MyWorld).soundController);
					
					if (Global.MUSIC_WHILE_WALKING)
					{
						(FP.world as MyWorld).soundController.fadeOut(5);
						//(FP.world as MyWorld).fadeMusicIn(10);
						//Global.playSounds = false;
						MyWorld.music.loop();
					}
					standingPush();
					Global.startedWalking = true;
					walking = false;
				}
				if (spritemap.currentAnim == 'standing_push' && spritemap.complete)
				{
					spritemap.play('walk');
					walking = true;
				}
				if (spritemap.currentAnim == 'stand')
				{
					spritemap.play('walk');
					walking = true;
				}
				else if (spritemap.currentAnim == 'walk')
				{
					if (Global.victim.x - x <= PUSH_DISTANCE)
						push();
					
					
					// Reset canPush on the 3rd frame of the walking animation
					if (spritemap.index == 3)
					{
						canPush = true;
					}
					// Allow a push every time the walking animation cycles back to the 0 frame
					else if (spritemap.index == 0 && canPush)
					{
						if (FP.random < 0)
						{
							push();
						}
						canPush = false;
					}
					walking = true;
				}
				else if (spritemap.currentAnim == 'push' && spritemap.complete)
				{
					spritemap.play('walk');
					canPush = true;
					walking = true;
				}
			}
			else
			{
				walking = false;
				spritemap.play("stand");
				if (sndWalking.playing)
					sndWalking.stop();
			}
			
			if (Input.released("X"))
			{
				if (!Global.reachedPlains)
				{
					FP.world.add(new textNotFarEnough);
					Global.numberOfStops++;
				}
				else
				{
					FP.world.add(new textUseMouse);
					FP.world.add(Global.playerShooting = new PlayerShooting);
					Global.playerShooting.x = x;
					Global.playerShooting.y = y;
					
					if (Global.MUSIC_WHILE_WALKING)
					{
						FP.world.add((FP.world as MyWorld).soundController = new SoundController((FP.world as MyWorld).location));
						//if ((FP.world as MyWorld).time == 'night')
							//(FP.world as MyWorld).soundController.startNight();
						MyWorld.music.stop();
						Global.playSounds = true;						
					}
					Global.fadeSounds = false;
					sndWalking.stop();
					FP.world.remove(this);
					
					
					//spritemap.play('push');
					//graphic = pushing;
					//pushing.play();
					//sndWalking.stop();
					//var playerDying:PlayerDying = new PlayerDying;
					//FP.world.add(playerDying);
					//playerDying.x = x;
					//playerDying.y = y;
					//FP.world.remove(this);
				}
			} 
		}
		
		public function standingPush():void
		{
			if (Global.playSounds)
				sndPush.play(0.5);
			spritemap.play('standing_push');
			Global.victim.stumbleAlarm.reset(Global.victim.STUMBLE_TIME);
		}
		
		public function push():void
		{
			trace('push');
			var vol:Number = 0.3 + 0.2 * FP.random;
			if (Global.playSounds)
				sndPush.play(vol);
			spritemap.play('push');
			Global.victim.stumbleAlarm.reset(Global.victim.STUMBLE_TIME);			
		}
		
		override public function removed():void
		{
			sndWalking.stop();
		}
		
	}
}