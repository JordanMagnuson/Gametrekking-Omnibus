package gallery 
{
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class Assets 
	{
		// Korea
		[Embed(source = "../../assets/gallery/korea/at_school_P1040483.jpg")] public static const KOREA_01_IMAGE:Class;
		public static const KOREA_01_CAPTION:String = "Some of the middle school students I taught for a year in the Korean countryside.";
		
		[Embed(source = "../../assets/gallery/korea/Monkey-in-The-Window.jpg")] public static const KOREA_02_IMAGE:Class;
		public static const KOREA_02_CAPTION:String = "Monkey in the window!";
		
		[Embed(source="../../assets/gallery/korea/going_home_1040431.jpg")] public static const KOREA_03_IMAGE:Class;
		public static const KOREA_03_CAPTION:String = "Students heading home for a pit stop after school, before continuing on to cram-school for the evening.";		
		
		[Embed(source="../../assets/gallery/korea/sledding_P1080323.jpg")] public static const KOREA_04_IMAGE:Class;
		public static const KOREA_04_CAPTION:String = "Sledding in the parking lot outside of my apartment in Gunsan.";	
		
		[Embed(source="../../assets/gallery/korea/blossoms_3423082756.jpg")] public static const KOREA_05_IMAGE:Class;
		public static const KOREA_05_CAPTION:String = "Sledding in the parking lot outside of my apartment in Gunsan.";	
		
		public static const KOREA_PHOTO_ARRAY:Array = new Array(
																	new Array(KOREA_01_IMAGE, KOREA_01_CAPTION), 
																	new Array(KOREA_03_IMAGE, KOREA_03_CAPTION),
																	new Array(KOREA_04_IMAGE, KOREA_04_CAPTION),
																	new Array(KOREA_04_IMAGE, KOREA_04_CAPTION),
																	new Array(KOREA_04_IMAGE, KOREA_04_CAPTION),
																	new Array(KOREA_04_IMAGE, KOREA_04_CAPTION),
																	new Array(KOREA_04_IMAGE, KOREA_04_CAPTION)
																);
		
		
		
		//public static const KOREA_PHOTO_ARRAY:Array = new Array(KOREA_01);
	}

}