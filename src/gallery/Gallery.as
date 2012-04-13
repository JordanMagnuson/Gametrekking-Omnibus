package gallery 
{
	import net.flashpunk.World;
	import net.flashpunk.utils.Input;
	import flash.ui.Mouse;
	
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class Gallery extends World
	{
		public static const FADE_IN_DURATION:Number = 1;
		public static const FADE_OUT_DURATION:Number = 1;
		
		public var photoArray:Array;
		public var currentIndex:int = 0;	
		public var finished:Boolean = false;
		public var loop:Boolean;
		
		public var currentPhoto:Photo;
		public var lastPhoto:Photo;			
		
		public function Gallery(photoArray:Array, loop:Boolean = true) 
		{
			super();
			this.photoArray = photoArray;
			this.loop = loop;
			currentPhoto = new Photo(0, 0, photoArray[currentIndex][0], photoArray[currentIndex][1]);
			Mouse.cursor = 'button';
		}
		
		override public function begin():void
		{
			add(currentPhoto);
			currentPhoto.fadeInCallback();
			currentIndex = 1;
		}
		
		override public function update():void
		{
			super.update();
			if (currentPhoto.fadeInComplete)
			{
				Mouse.show();
				if (Input.mousePressed)
				{
					nextPhoto();
				}
			}
		}
		
		public function nextPhoto(fadeIn:Boolean = true):void
		{
			if (finished && !loop)
			{
				return;
			}
			
			Mouse.hide();
			
			if (currentIndex < photoArray.length)
			{
				lastPhoto = currentPhoto;
				lastPhoto.fadeOut(FADE_OUT_DURATION);
				add(currentPhoto = new Photo(0, 0, photoArray[currentIndex][0], photoArray[currentIndex][1]));
				currentPhoto.fadeIn(FADE_IN_DURATION);
			}
			else
			{
				finished = true;
				currentIndex = 0;
				if (loop)
				{
					lastPhoto = currentPhoto;
					lastPhoto.fadeOut(FADE_OUT_DURATION);
					add(currentPhoto = new Photo(0, 0, photoArray[currentIndex][0], photoArray[currentIndex][1]));
					currentPhoto.fadeIn(FADE_IN_DURATION);
				}				
			}
			currentIndex++;
		}				
		
	}

}