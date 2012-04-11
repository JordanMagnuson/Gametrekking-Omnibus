package menu 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.FP;
	import jui.Button;
	
	/**
	 * ...
	 * @author ...
	 */
	public class NavigationBar extends Entity
	{
		public const SLIDE_DURATION:Number = 1;
		public var slideDirection:Number; 
		
		public var background:Image = Image.createRect(SuperGlobal.SCREEN_WIDTH, 46, Colors.MENU_CREAM, 0.5);
		
		public var introButton:Button;
		public var koreaButton:Button;
		public var taiwanButton:Button;
		
		public var navigationUnderline:NavigationUnderline;
		
		public function NavigationBar() 
		{
			super();
			graphic = background;		
			layer = -100;
		}
		
		override public function added():void
		{
			// Logo
			var logo:Entity;
			FP.world.add(logo = new Entity(0, 0, new Backdrop(Assets.NAV_LOGO, false, false)));		
			logo.layer = layer;
			//add(new Entity(200, 200, new Text("The Gametrekking Omnibus", 0, 0, { font: "Casual Encounter", size: 14 } )));
			
			// Intro
			FP.world.add(introButton = new Button(388, 0, new Image(Assets.NAV_INTRO), null, Global.NAV_HOVER_SCALE, null, null, false, null));
			introButton.layer = layer;
			
			// Korea
			FP.world.add(koreaButton = new Button(475, 0, new Image(Assets.NAV_KOREA), null, Global.NAV_HOVER_SCALE, null, null, false, gotoKorea));	
			koreaButton.layer = layer;
			
			// Taiwan
			FP.world.add(taiwanButton = new Button(562, 0, new Image(Assets.NAV_TAIWAN), null, Global.NAV_HOVER_SCALE, null, null, false, gotoTaiwan));	
			//FP.world.add(taiwanButton = new Button(562, 0, new Text("Taiwan", 0, 0, { font: "Casual Encounter", size: 12 }), null, null, null, false, gotoTaiwan));	
			taiwanButton.layer = layer;
			
			// Navigation Underline
			switch(Global.navButtonIndex) 
			{
				//trace('FP.world: ' + getQualifiedClassName(FP.world));
				case Global.KOREA_BUTTON_INDEX:
					FP.world.add(navigationUnderline = new NavigationUnderline(koreaButton)); 
					break;
				case Global.TAIWAN_BUTTON_INDEX:
					FP.world.add(navigationUnderline = new NavigationUnderline(taiwanButton)); 
					break;
				default:
					break;
			}
			
		}
		
		public function gotoKorea():void
		{
			if (Global.navButtonIndex < Global.KOREA_BUTTON_INDEX)
			{
				slideDirection = 1;
			}
			else
			{
				slideDirection = -1;
			}
			FP.world.add(new SlideTransition(new Backdrop(Assets.KOREA_LANDING, false, false), Colors.WHITE, slideDirection, SLIDE_DURATION, KoreaLanding));
			navigationUnderline.goto(koreaButton, SLIDE_DURATION);
		}
		
		public function gotoTaiwan():void
		{
			if (Global.navButtonIndex < Global.TAIWAN_BUTTON_INDEX)
			{
				slideDirection = 1;
			}
			else
			{
				slideDirection = -1;
			}			
			FP.world.add(new SlideTransition(new Backdrop(Assets.TAIWAN_LANDING, false, false), Colors.WHITE, slideDirection, SLIDE_DURATION, TaiwanLanding));
			navigationUnderline.goto(taiwanButton, SLIDE_DURATION);
		}		
		
	}

}