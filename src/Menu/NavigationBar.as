package menu 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.FP;
	import jui.Button;
	import flash.desktop.NativeApplication;
	import punk.transition.Transition;
	
	/**
	 * ...
	 * @author ...
	 */
	public class NavigationBar extends Entity
	{
		public const SLIDE_DURATION:Number = 1;
		public var slideDirection:String; 
		
		public var background:Image = Image.createRect(SuperGlobal.SCREEN_WIDTH, 46, Colors.MENU_CREAM, 0.5);
		
		public var introButton:Button;
		public var koreaButton:Button;
		public var taiwanButton:Button;
		public var vietnamButton:Button;
		public var cambodiaButton:Button;
		public var creditsButton:Button;
		public var quitButton:Button;
		
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
			FP.world.add(introButton = new Button(366, 0, new Image(Assets.NAV_INTRO), null, Global.NAV_HOVER_SCALE, null, null, false, gotoIntro));
			introButton.layer = layer;
			
			// Korea
			FP.world.add(koreaButton = new Button(453, 0, new Image(Assets.NAV_KOREA), null, Global.NAV_HOVER_SCALE, null, null, false, gotoKorea));	
			koreaButton.layer = layer;
			
			// Taiwan
			FP.world.add(taiwanButton = new Button(540, 0, new Image(Assets.NAV_TAIWAN), null, Global.NAV_HOVER_SCALE, null, null, false, gotoTaiwan));	;	
			taiwanButton.layer = layer;
			
			// Vietnam
			FP.world.add(vietnamButton = new Button(635, 0, new Image(Assets.NAV_VIETNAM), null, Global.NAV_HOVER_SCALE, null, null, false, gotoVietnam));	;	
			vietnamButton.layer = layer;
			
			// Cambodia
			FP.world.add(cambodiaButton = new Button(741, 0, new Image(Assets.NAV_CAMBODIA), null, Global.NAV_HOVER_SCALE, null, null, false, gotoCambodia));	;	
			cambodiaButton.layer = layer;		
			
			// Credits
			FP.world.add(creditsButton = new Button(858, 0, new Image(Assets.NAV_CREDITS), null, Global.NAV_HOVER_SCALE, null, null, false, gotoCredits));	;	
			creditsButton.layer = layer;		
			
			// Quit
			FP.world.add(quitButton = new Button(953, 0, new Image(Assets.NAV_QUIT), null, Global.NAV_HOVER_SCALE, null, null, false, quit));	;	
			quitButton.layer = layer;					
			
			// Navigation Underline
			switch(Global.navButtonIndex) 
			{
				//trace('FP.world: ' + getQualifiedClassName(FP.world));
				case Global.INTRO_BUTTON_INDEX:
					FP.world.add(navigationUnderline = new NavigationUnderline(introButton)); 
					break;				
				case Global.KOREA_BUTTON_INDEX:
					FP.world.add(navigationUnderline = new NavigationUnderline(koreaButton)); 
					break;
				case Global.TAIWAN_BUTTON_INDEX:
					FP.world.add(navigationUnderline = new NavigationUnderline(taiwanButton)); 
					break;
				case Global.VIETNAM_BUTTON_INDEX:
					FP.world.add(navigationUnderline = new NavigationUnderline(vietnamButton)); 
					break;					
				case Global.CAMBODIA_BUTTON_INDEX:
					FP.world.add(navigationUnderline = new NavigationUnderline(cambodiaButton)); 
					break;	
				case Global.CREDITS_BUTTON_INDEX:
					FP.world.add(navigationUnderline = new NavigationUnderline(creditsButton)); 
					break;					
				default:
					break;
			}
			
		}
		
		public function quit():void
		{
			Global.inTransition = true;
			navigationUnderline.goto(quitButton, SLIDE_DURATION);
			FP.alarm(SLIDE_DURATION, quitFinal);
		}
		
		public function quitFinal():void
		{
			NativeApplication.nativeApplication.exit();
		}
		
		public function gotoCredits():void
		{
			trace('goto credits');
			if (Global.inTransition)
			{
				trace("can't slide: in transition");
				return;	
			}		
			if (Global.navButtonIndex == Global.CREDITS_BUTTON_INDEX)
			{
				trace("can't slide: already on button " + Global.navButtonIndex);
				return;	
			}			
				
			FP.world.add(new SlideTransition(new Backdrop(Assets.CREDITS_TOP, false, false), Colors.WHITE, 'up', SLIDE_DURATION, Credits, null, -200));
			navigationUnderline.goto(creditsButton, SLIDE_DURATION);			
			//Transition.to(Credits, new Global.TRANS_OUT(Global.TRANS_OUT_OPTIONS), new Global.TRANS_IN(Global.TRANS_IN_OPTIONS)); 	
		}
		
		public function gotoIntro():void
		{
			trace('goto intro');
			if (Global.inTransition)
			{
				trace("can't slide: in transition");
				return;	
			}		
			if (Global.navButtonIndex == Global.INTRO_BUTTON_INDEX)
			{
				trace("can't slide: already on button " + Global.navButtonIndex);
				return;	
			}		
				
			Global.inTransition = true;
			
			if (Global.navButtonIndex < Global.INTRO_BUTTON_INDEX)
			{
				slideDirection = 'left';
			}
			else
			{
				slideDirection = 'right';
			}
			FP.world.add(new SlideTransition(new Backdrop(Assets.INTRO_LANDING, false, false), Colors.WHITE, slideDirection, SLIDE_DURATION, IntroLanding));
			navigationUnderline.goto(introButton, SLIDE_DURATION);
		}		
		
		public function gotoKorea():void
		{
			trace('goto korea');
			if (Global.inTransition)
			{
				trace("can't slide: in transition");
				return;	
			}
			if (Global.navButtonIndex == Global.KOREA_BUTTON_INDEX)
			{
				trace("can't slide: already on button " + Global.navButtonIndex);
				return;	
			}		
				
			Global.inTransition = true;
			
			if (Global.navButtonIndex < Global.KOREA_BUTTON_INDEX)
			{
				slideDirection = 'left';;
			}
			else
			{
				slideDirection = 'right';;
			}
			FP.world.add(new SlideTransition(new Backdrop(Assets.KOREA_LANDING, false, false), Colors.WHITE, slideDirection, SLIDE_DURATION, KoreaLanding));
			navigationUnderline.goto(koreaButton, SLIDE_DURATION);
		}
		
		public function gotoTaiwan():void
		{
			trace('goto taiwan');
			if (Global.inTransition)
			{
				trace("can't slide: in transition");
				return;	
			}
			if (Global.navButtonIndex == Global.TAIWAN_BUTTON_INDEX)
			{
				trace("can't slide: already on button " + Global.navButtonIndex);
				return;	
			}					
				
			Global.inTransition = true;			
			
			if (Global.navButtonIndex < Global.TAIWAN_BUTTON_INDEX)
			{
				slideDirection = 'left';
			}
			else
			{
				slideDirection = 'right';
			}			
			FP.world.add(new SlideTransition(new Backdrop(Assets.TAIWAN_LANDING, false, false), Colors.WHITE, slideDirection, SLIDE_DURATION, TaiwanLanding));
			navigationUnderline.goto(taiwanButton, SLIDE_DURATION);
		}		
		
		public function gotoVietnam():void
		{
			trace('goto vietnam');
			if (Global.inTransition)
			{
				trace("can't slide: in transition");
				return;	
			}
			if (Global.navButtonIndex == Global.VIETNAM_BUTTON_INDEX)
			{
				trace("can't slide: already on button " + Global.navButtonIndex);
				return;	
			}		
				
			Global.inTransition = true;			
			
			if (Global.navButtonIndex < Global.VIETNAM_BUTTON_INDEX)
			{
				slideDirection = 'left';
			}
			else
			{
				slideDirection = 'right';
			}			
			FP.world.add(new SlideTransition(new Backdrop(Assets.VIETNAM_LANDING, false, false), Colors.WHITE, slideDirection, SLIDE_DURATION, VietnamLanding));
			navigationUnderline.goto(vietnamButton, SLIDE_DURATION);
		}	
		
		public function gotoCambodia():void
		{
			trace('goto cambodia');
			if (Global.inTransition)
			{
				trace("can't slide: in transition");
				return;	
			}
			if (Global.navButtonIndex == Global.CAMBODIA_BUTTON_INDEX)
			{
				trace("can't slide: already on button " + Global.navButtonIndex);
				return;	
			}		
				
			Global.inTransition = true;			
			
			if (Global.navButtonIndex < Global.CAMBODIA_BUTTON_INDEX)
			{
				slideDirection = 'left';
			}
			else
			{
				slideDirection = 'right';
			}			
			FP.world.add(new SlideTransition(new Backdrop(Assets.CAMBODIA_LANDING, false, false), Colors.WHITE, slideDirection, SLIDE_DURATION, CambodiaLanding));
			navigationUnderline.goto(cambodiaButton, SLIDE_DURATION);
		}			
		
	}

}