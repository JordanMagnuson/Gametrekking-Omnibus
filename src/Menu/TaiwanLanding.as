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
	
	/**
	 * ...
	 * @author ...
	 */
	public class TaiwanLanding extends MenuLanding
	{
		[Embed(source = "../../assets/gear.png")] public static const GFX_GEAR:Class;
		[Embed(source = "../../assets/gearHover.png")] public static const GFX_GEAR_HOVER:Class;		
		
		public function TaiwanLanding() 
		{
			super();
			add(new Button(100, 100, new Text('Booya'), new Text('Heya'), null, null, true, gotoStatusQuo));
			add(new jui.ButtonController);
		}
		
		override public function begin():void
		{
			//var skin:UISkin = new UISkin();
			//skin.backgroundColor = 0xFF000000;
			//skin.borderColor = 0xFFFF3366;
			//skin.textColor = 0xFF3366;
			//skin.hoverBackgroundColor = 0xFF831D37;
			//skin.checkMarkColor = 0xFFE27D96;		
			//
			//var uiEntity:UIEntity = new UIEntity(0, 0, 1024, 600, skin);
			//var clickCount:int = 0;
			//uiEntity.AddGuiItem(new Button(new Rectangle(32, 32, 256, 32), 
			//{
				//OnClick: function(button:Button):void 
					//{
						//clickCount += 1;
						//button.label = clickCount.toString() + " Clicks";
					//},
				//label: "0 Clicks" 
			//} ));		
			//
			//
			//uiEntity.AddGuiItem(new Button(new Rectangle(336, 80, 64, 64), { 
				//OnHover: function(button:Button):void 
					//{
						//button.label = "booya";
					//},				
				//label: "heya",
				//hoverLabel: "booya",
				//background: (new Text("heya")).source,
				//hoverBackground: (new Text("booya")).source,
				//border: false
			//} ));			
			//
			//FP.world.add(uiEntity);			
		}
		
	}

}