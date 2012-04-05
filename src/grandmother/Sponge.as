package grandmother  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Sfx;
	import net.flashpunk.utils.Input;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Sponge extends Entity
	{
		public var image:Image = new Image(Assets.SPONGE);
		public var spongeColorImage:Image = new Image(Assets.SPONGE_COLOR);
		public var spongeColorEntity:Entity;
		public var sndSplash:Sfx = new Sfx(Assets.SND_BUCKET_SPLASH);
		public var sndSplashSmall:Sfx = new Sfx(Assets.SND_BUCKET_SPLASH_SMALL);
		public var saturation:Number = 1;
		
		// Sound
		public var SndSponge01:Sfx = new Sfx(Assets.SND_SPONGE_01);
		
		public function Sponge(x:Number = 0, y:Number = 0) 
		{
			super(x, y, image);
			image.centerOO();
			spongeColorImage.centerOO();
			type = 'sponge';
			layer = -900;
			visible = false; 
			
			spongeColorEntity = new Entity(x, y, spongeColorImage);
			spongeColorEntity.layer = -901;
		}
		
		override public function added():void
		{
			FP.world.add(spongeColorEntity);
		}
		
		override public function removed():void
		{
			FP.world.remove(spongeColorEntity);
		}
		
		override public function update():void
		{
			x = spongeColorEntity.x = world.mouseX;
			y = spongeColorEntity.y = world.mouseY;
			
			spongeColorImage.alpha = Global.sponge.saturation + Global.MIN_SPONGE_SATURATION;
			
			if (visible)
				spongeColorEntity.visible = true;
			else
				spongeColorEntity.visible = false;
			
			if (Input.mouseDown && Global.hasSponge) 
			{
				if (collideWith(Global.dust, x, y))
				{			
					Global.dust.clean(x, y);
					if (!Global.dust.cleaned) saturation /= 1.01;
					
					//if (FP.rand(100) <= 1 && !SndSponge01.playing)
					if (!Global.dust.cleaned && Input.mousePressed && Global.sponge.saturation > Global.MIN_SPONGE_SATURATION)
						SndSponge01.play();
				}

			}	
			
			if (Input.mousePressed)
			{
				if (collideWith(Global.bucket, x, y))
				{
					saturation = 1;
					if (Global.hasSponge) 
						sndSplash.play();
					else 
						sndSplashSmall.play();
				}				
			}
		}
		
	}

}