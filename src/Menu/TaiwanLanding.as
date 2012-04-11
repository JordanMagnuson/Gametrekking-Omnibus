package menu 
{
	import flash.geom.Rectangle;
	import gum.FlashPunk.UIEntity;
	import gum.UISkin;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import jui.Button;
	import statusquo.GameWorld;
	
	/**
	 * ...
	 * @author ...
	 */
	public class TaiwanLanding extends MenuLanding
	{		
		public function TaiwanLanding() 
		{
			super();
			//add(new Button(100, 100, new Text('Booya'), new Text('Heya'), null, null, true, gotoStatusQuo));
			add(new Entity(0, 0, new Backdrop(Assets.TAIWAN_LANDING)));
			
			Global.navButtonIndex = Global.TAIWAN_BUTTON_INDEX;
		}
		
		public function gotoStatusQuo():void
		{
			FP.world = new GameWorld;
		}		
		
		override public function begin():void
		{
			super.begin();		
		}
		
	}

}