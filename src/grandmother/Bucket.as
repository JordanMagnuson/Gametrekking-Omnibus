package grandmother  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Sfx;
	import net.flashpunk.tweens.motion.LinearMotion;
	import net.flashpunk.utils.Ease;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Bucket extends Entity
	{
		public var image:Image = new Image(Assets.BUCKET);
		public var sndEnter:Sfx = new Sfx(Assets.SND_BUCKET_ENTER);
		public var motionTween:LinearMotion;
		
		public var bucketFront:Entity;
		public var imageFront:Image = new Image(Assets.BUCKET_FRONT);
		
		public function Bucket(x:Number = 0, y:Number = 0) 
		{
			super(x, y, image);
			type = 'bucket';
			setHitboxTo(image);
			this.x = 16;
			this.y = FP.height;
			motionTween = new LinearMotion(motionComplete);
			
			bucketFront = new Entity(this.x, this.y, imageFront);
			bucketFront.layer = -950;
		}
		
		override public function added():void
		{
			trace('bucket added');
			FP.world.add(bucketFront);
			sndEnter.play();
			addTween(motionTween);
			motionTween.setMotion(x, y, x, 340, 3, Ease.quadOut);
		}
		
		override public function update():void
		{
			x = bucketFront.x = motionTween.x;
			y = bucketFront.y = motionTween.y;
			super.update();
		}
		
		public function motionComplete():void
		{
			trace('bucket motion complete');
		}
		
		public function drop():void
		{
			sndEnter.play();
			motionTween.setMotion(x, y, x, FP.height + 20, 3, Ease.quadIn);
		}
		
	}

}