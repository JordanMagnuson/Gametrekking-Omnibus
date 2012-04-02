package freedombridge  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Sfx;
	import net.flashpunk.tweens.sound.SfxFader;
	import net.flashpunk.World;
	import freedombridge.worlds.MyWorld;
	
	public class River extends Entity
	{
		/**
		 * Embedded river graphic.
		 */
		[Embed(source = '../../assets/freedombridge/river.png')] private static const S_RIVER:Class;
		public var image:MyBackdrop = new MyBackdrop(S_RIVER, false, true);
		
		/**
		 * Sound
		 */
		[Embed(source='../../assets/freedombridge/river_sound.swf', symbol='river.wav')] private const SND_RIVER:Class;
		public var sndRiver:Sfx = new Sfx(SND_RIVER);
		//private var fader:SfxFader = new SfxFader(sndRiver);
		
		public var distToPlayer:Number;
		public var finished:Boolean = false;
		public var riverVol:Number = 0;
		
		/**
		 * Constructor.
		 */		
		public function River() 
		{
			graphic = image;
			
			layer = 100;			
			
			image.x = -image.width / 2;
			image.y = 0				
			
			sndRiver.loop();			
			sndRiver.volume = 0;
		}
		
		/**
		 * Updates the background, makes it scroll.
		 */
		override public function update():void 
		{
			y += FP.elapsed * 100;
			updateSound();
		}
		
		/**
		 * Update sound volume based on player distance.
		 */
		private function updateSound():void
		{
			//trace('vol: ' + sndRiver.volume);
			if (!MyWorld.player.finished)
			{
				distToPlayer = Math.abs(MyWorld.river.x - MyWorld.player.x) / 500.00 + 1;
				riverVol = Math.pow(1 / distToPlayer, 2);
				sndRiver.volume = riverVol;
				sndRiver.pan = 1 - riverVol - 0.1;
				//trace('riverVol: ' + sndRiver.volume);
				//trace('pan: ' + sndRiver.pan);
			}
			else if (!finished)
			{
				finished = true;
				fadeSound();
			}	
		}
		
		/**
		 * Fade sound.
		 */
		private function fadeSound():void
		{
			var fader:SfxFader = new SfxFader(sndRiver);
			addTween(fader);
			fader.fadeTo(0, 15);
			fader.start();
		}
		
	}

}