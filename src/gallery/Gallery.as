package gallery 
{
	import net.flashpunk.World;
	import net.flashpunk.utils.Input;
	import flash.ui.Mouse;
	import punk.transition.Transition;
	import menu.Global;
	import net.flashpunk.utils.Key;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;		
	
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class Gallery extends World
	{
		public static const MORE_PHOTOS_KEY:int = Key.X;
		
		public static const FADE_IN_DURATION:Number = 1;
		public static const FADE_OUT_DURATION:Number = 1;
		
		public var photoArray:Array;
		public var currentIndex:int = 0;	
		public var finished:Boolean = false;
		public var loop:Boolean = false;
		public var goto:Class;
		public var morePhotosLink:String;
		
		public var currentPhoto:Photo;
		public var lastPhoto:Photo;			
		
		public function Gallery(photoArray:Array, goto:Class = null, morePhotosLink:String = null) 
		{
			super();
			this.photoArray = photoArray;
			this.goto = goto;
			this.morePhotosLink = morePhotosLink;
			currentPhoto = new Photo(0, 0, photoArray[currentIndex][0], photoArray[currentIndex][1]);	
		}
		
		override public function begin():void
		{
			Mouse.cursor = 'button';
			add(currentPhoto);
			currentPhoto.fadeInCallback();
			currentIndex = 1;
		}
		
		override public function update():void
		{
			super.update();
			
			// Return to menu
			if (Input.pressed(SuperGlobal.RETURN_KEY)) 
			{
				if (goto) Transition.to(goto, new Global.TRANS_OUT(Global.TRANS_OUT_OPTIONS), new Global.TRANS_IN(Global.TRANS_IN_OPTIONS)); 
			}	
			
			// More photos link
			if (Input.pressed(MORE_PHOTOS_KEY) && morePhotosLink != null) 
			{
				var request:URLRequest = new URLRequest(morePhotosLink);		
				try {
					navigateToURL(request, '_blank'); // second argument is target
				} catch (e:Error) {
					trace("Error occurred!");
				}				
			}				
			
			// Next photo on click
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
				if (goto) Transition.to(goto, new Global.TRANS_OUT(Global.TRANS_OUT_OPTIONS), new Global.TRANS_IN(Global.TRANS_IN_OPTIONS)); 
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