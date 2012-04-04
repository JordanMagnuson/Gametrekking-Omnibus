package heartattack  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Tween;
	import net.flashpunk.Tweener;
	import net.flashpunk.tweens.misc.Alarm;
	import Math
	import net.flashpunk.tweens.misc.ColorTween;
	import net.flashpunk.tweens.misc.NumTween;
	import net.flashpunk.tweens.misc.VarTween;
	import net.flashpunk.tweens.motion.LinearMotion;
	
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class HeartController extends Entity
	{
		public var personController:PersonController;
		public var heartSoundController:HeartSoundController;
		public var direction:Boolean;					// Controlls wither the heartbeat pulses travel left or right. True = left.
		public var heartRate:Number;	// How frequently the heart beats.
		public var pulseSpeed:Number;			// Number of pixels the heartbeat images move forward every frame.
		public var lastFlatHeartbeat:HeartbeatFlat = null;
		
		public var health:Number = Global.STARTING_HEALTH;							// 0 - 1, determines the amplitude of the heart beats... if 0, heart attack
		
		public var hotZone:HotZone;
		public var flatLine:FlatLine;
		
		public var beatAlarm:Alarm = new Alarm(heartRate, beat);
		
		public var beatCount:int = 0;
		
		public var heartRateTween:NumTween = new NumTween(finishedTweeningHeartRate);
		public var tweeningHeartRate:Boolean = false;
		
		public var pulseSpeedTween:NumTween = new NumTween(finishedTweeningPulseSpeed);
		public var tweeningPulseSpeed:Boolean = false;
		
		public function HeartController(personController:PersonController, x:Number = 0, y:Number = 0, hotZoneX:Number = 100, direction:Boolean = true, heartRate:Number = 120, pulseSpeed:Number = 2) 
		{
			super(x, y);
			this.personController = personController;
			this.direction = direction;
			hotZone = new HotZone(hotZoneX, y, this);
			heartSoundController = new HeartSoundController(this);
			this.heartRate = heartRate;
			this.pulseSpeed = pulseSpeed;
		}
		
		override public function added():void
		{
			FP.world.add(hotZone);
			addTween(beatAlarm);
			addTween(heartRateTween);
			addTween(pulseSpeedTween);
			if (!this.personController.markedForPause)
				beat();
			//addTween(beatAlarm, true);
		}
		
		public function reset():void
		{
			//trace('heartcontroller reset');
			//trace('heart rate: ' + heartRate);
			//trace('pulse speed: ' + pulseSpeed);
			heartSoundController.reset();
			if (tweeningHeartRate) finishedTweeningHeartRate();
			if (tweeningPulseSpeed) finishedTweeningPulseSpeed();
			beatCount = 0;
			lastFlatHeartbeat = null;
		}
		
		override public function update():void
		{
			super.update();
			
			if (tweeningHeartRate)
			{
				//trace('heartcontroller tween value: ' + heartRateTween.value);
				heartRate = heartRateTween.value;
				//trace('heart rate tween: ' + heartRateTween.value);
			}
			
			if (tweeningPulseSpeed)
			{
				//trace('heartcontroller pulseSpeedTween value: ' + pulseSpeedTween.value);
				pulseSpeed = pulseSpeedTween.value;				
			}
			//trace('heart controller updating');
		}
		
		public function beat():void
		{
			trace(personController.type + ' heartcontroller beat');
			trace(personController.type + ' heartRate: ' + heartRate);
			trace(personController.type + ' pulseSpeed: ' + pulseSpeed);

			// Adjust photo fade in speed to heart rate
			this.personController.photoController.fadeInDuration = heartRate / 2;
			this.personController.photoController.fadeOutDuration = heartRate / 2;
			trace('heartcntrlr fadeInduration: ' + this.personController.photoController.fadeInDuration);		
			
			
			// Start sound on first beat
			if (Global.CONSTANT_HEART_SOUND && beatCount == 0)
			{
				FP.world.add(heartSoundController);
			}
			
			// Update the length of last flat heart beat to meet current up beat
			if (lastFlatHeartbeat)
			{
				lastFlatHeartbeat.updateLength();
			}
			
			// Heartbeat up
			var u:HeartbeatUp = FP.world.create(HeartbeatUp) as HeartbeatUp;
			u.heartController = this;
			u.reset();
			
			// Heartbeat down
			var d:HeartbeatDown = FP.world.create(HeartbeatDown) as HeartbeatDown;
			d.heartController = this;
			d.reset();	
			u.pairedHeartbeatDown = d;
			
			// Flat line between beats
			var f:HeartbeatFlat = FP.world.create(HeartbeatFlat) as HeartbeatFlat;
			f.heartController = this;
			f.reset();				
			lastFlatHeartbeat = f;
			
			beatCount++;
			beatAlarm.reset(heartRate);
		}
		
		public function getHeartbeats(upBeats:Boolean = true, downBeats:Boolean = true, flatBeats:Boolean = true):Array
		{
			var myHeartbeats:Array = [];	
			
			// up beats
			if (upBeats)
			{
				var heartbeatUpList:Array = [];
				FP.world.getClass(HeartbeatUp, heartbeatUpList);				
				for each (var u:HeartbeatUp in heartbeatUpList)
				{
					if (u.heartController == this)
						myHeartbeats.push(u);
				}	
			}
			
			// down beats
			if (downBeats)
			{
				var heartbeatDownList:Array = [];
				FP.world.getClass(HeartbeatDown, heartbeatDownList);
				for each (var d:HeartbeatDown in heartbeatDownList)
				{
					if (d.heartController == this)
						myHeartbeats.push(d);
				}	
			}
			
			// flat beats
			if (flatBeats)
			{
				var heartbeatFlatList:Array = [];
				FP.world.getClass(HeartbeatFlat, heartbeatFlatList);				
				for each (var f:HeartbeatFlat in heartbeatFlatList)
				{
					if (f.heartController == this)
						myHeartbeats.push(f);
				}	
			}			
			
			return myHeartbeats;	
		}
		
		public function pause():void
		{
			// Stop sound
			//heartSoundController.active = false;
			heartSoundController.beatLoop.stop();
			hotZone.active = false;
			
			// Stop heartbeats moving
			var heartBeats:Array = getHeartbeats();
			for each (var h:Heartbeat in heartBeats)
			{
				h.pause();
			}			
			
			// Deactivate controller (so that the beat alarm stops)
			this.active = false;
		}
		
		public function unpause():void
		{
			// Activate controller	
			this.active = true;
			hotZone.active = true;
			
			// Resume sound
			//heartSoundController.active = true;
			if (Global.CONSTANT_HEART_SOUND)
				if (!heartSoundController.beatLoop.playing) heartSoundController.beatLoop.resume();			
			
			// Start heartbeats moving
			var heartBeats:Array = getHeartbeats();
			for each (var h:Heartbeat in heartBeats)
			{
				h.unpause();
			}			
		}
		
		public function fadeOut(duration:Number):void
		{
			//trace('heart controller fade out');
			
			// Fade beats
			var heartBeats:Array = getHeartbeats();
			for each (var h:Heartbeat in heartBeats)
			{
				if (h.heartController == this)
				{
					h.pause();
					h.fadeOut(duration);
				}
			}			
			
			// Fade sound controller
			heartSoundController.fadeOut()
			
			this.active = false					// Deactivate this controller, so that beatAlarm stops going
		}
		
		public function tweenHeartRate(targetHeartRate:Number, duration:Number):void
		{
			//trace('heartController.tweenHeartRate');
			heartRateTween.tween(heartRate, targetHeartRate, duration);
			//addTween(heartRateTween, true);
			tweeningHeartRate = true;
		}
		
		public function finishedTweeningHeartRate():void
		{
			trace('finished tweening heart rate');
			//heartRateTween.cancel();
			//removeTween(heartRateTween)
			tweeningHeartRate = false;
		}
		
		public function tweenPulseSpeed(targetPulseSpeed:Number, duration:Number):void
		{
			//trace('heartController.tweenPulseSpeed');
			pulseSpeedTween.tween(pulseSpeed, targetPulseSpeed, duration);
			//addTween(pulseSpeedTween, true);
			tweeningPulseSpeed = true;
		}
		
		public function finishedTweeningPulseSpeed():void
		{
			//pulseSpeedTween.cancel();
			//removeTween(pulseSpeedTween)
			tweeningPulseSpeed = false;
		}		
		
		public function setHeartRatePulseSpeed(heartRate:Number, pulseSpeed:Number):void
		{
			this.heartRate = heartRate;		
			this.pulseSpeed = pulseSpeed;
		}
		
		public function loseHealth():void
		{
			health -= Global.LOSE_HEALTH_AMOUNT;
			
			// Update sound volume
			heartSoundController.updateVolume(health);
			
			// Die
			var heartbeatList:Array = getHeartbeats();			
			if (health <= 0.1)
			{
				// Add solid white line
				FP.world.add(this.flatLine = new FlatLine(this));
				
				// Remove everything else
				for each (var h:Heartbeat in heartbeatList)
				{
					FP.world.remove(h);
				}	
				this.personController.dead = true;
			}
			// Shrink
			else
			{
				for each (h in heartbeatList)
				{
					h.shrink();
				}					
			}	
		}
		
	}

}