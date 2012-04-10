package menu 
{
	/**
	 * ...
	 * @author ...
	 */
	public class Assets 
	{
		[Embed(source = "../../assets/menu/stamp_background.jpg")] public static const STAMP_BACKGROUND:Class;
		[Embed(source = "../../assets/CasualEncounter.ttf", embedAsCFF = "false", fontFamily = 'Casual Encounter')] public static const CASUAL_ENCOUNTER:Class;
		
		// Navigation
		[Embed(source = "../../assets/menu/nav_logo.png")] public static const NAV_LOGO:Class;
		[Embed(source = "../../assets/menu/nav_intro.png")] public static const NAV_INTRO:Class;
		[Embed(source = "../../assets/menu/nav_korea.png")] public static const NAV_KOREA:Class;	
		[Embed(source = "../../assets/menu/nav_taiwan.png")] public static const NAV_TAIWAN:Class;
		
		// Landing pages
		[Embed(source = "../../assets/menu/taiwan_landing.jpg")] public static const TAIWAN_LANDING:Class;
	}

}