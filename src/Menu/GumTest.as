package menu
{
	import flash.geom.Rectangle;
	import gum.controls.Button;
	import gum.controls.CheckBox;
	import gum.controls.InputText;
	import gum.controls.Label;
	import gum.controls.ProgressBar;
	import gum.controls.RadioSet;
	import gum.controls.ScrollingText;
	import gum.controls.ScrollPanel;
	import gum.controls.Slider;
	import gum.FlashPunk.*;
	import gum.UISkin;
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import gum.*;
	import net.flashpunk.utils.Input;
	import net.flashpunk.World;
	

	public class GumTest extends World 
	{
		[Embed(source = "../../assets/gear.png")] public static const GFX_GEAR:Class;
		[Embed(source = "../../assets/gearHover.png")] public static const GFX_GEAR_HOVER:Class;
		
		private var uiEntity:UIEntity = null;
		
		public function GumTest():void 
		{
		}
		
		override public function begin():void
		{
			//FP.console.enable();
			
			var skin:UISkin = new UISkin();
			skin.backgroundColor = 0xFF000000;
			skin.borderColor = 0xFFFF3366;
			skin.textColor = 0xFF3366;
			skin.hoverBackgroundColor = 0xFF831D37;
			skin.checkMarkColor = 0xFFE27D96;
			
			uiEntity = new UIEntity(0, 0, 640, 480, skin);
			
			//A button that counts how many times it is clicked.
			var clickCount:int = 0;
			uiEntity.AddGuiItem(new Button(new Rectangle(32, 32, 256, 32), 
			{
				OnClick: function(button:Button):void 
					{
						clickCount += 1;
						button.label = clickCount.toString() + " Clicks";
					},
				label: "0 Clicks" 
			} ));
			
			//Radio button set
			var radioSet:RadioSet = new RadioSet();
			uiEntity.AddGuiItem(new CheckBox(new Rectangle(32, 80, 256, 32), { label : "one", radioSet: radioSet, checked: true } ));
			uiEntity.AddGuiItem(new CheckBox(new Rectangle(32, 120, 256, 32), { label : "two", radioSet: radioSet } ));
			uiEntity.AddGuiItem(new CheckBox(new Rectangle(32, 160, 256, 32), { label : "three", radioSet: radioSet } ));
			
			//Text boxes
			uiEntity.AddGuiItem(new InputText(new Rectangle(32, 208, 256, 32)));
			uiEntity.AddGuiItem(new InputText(new Rectangle(32, 248, 256, 32), { password: true }));

			//Sliders
			uiEntity.AddGuiItem(new Label(new Rectangle(336, 32, 128, 32), { id: 1, text : "Label." } ));
			uiEntity.AddGuiItem(new Slider(new Rectangle(304, 32, 16, 256), 
			{ 
				orientation: UIItem.VERTICAL,
				minimum: 0, 
				maximum:255,
				OnSlide: function(slider:Slider):void { uiEntity.gui.FindItem(1).text = slider.position.toString(); }
			} ));
			uiEntity.AddGuiItem(new Slider(new Rectangle(32, 296, 256, 16), { orientation: UIItem.HORIZONTAL,
				minimum: 0, maximum:255 } ));
				
			uiEntity.AddGuiItem(new Button(new Rectangle(336, 80, 64, 64), { 
				background: (new GFX_GEAR()).bitmapData,
				hoverBackground: (new GFX_GEAR_HOVER()).bitmapData,
				border: false
			} ));
			
			uiEntity.AddGuiItem(new ProgressBar(new Rectangle(32, 328, 256, 16), 
			{ 
				OnUpdate: function(bar:ProgressBar, input:UIInput):void
				{
					bar.percentage += input.elapsedTime / 5;
					if (bar.percentage >= 1) bar.percentage = 0;
				}
			} ));
			
			uiEntity.AddGuiItem(new InputText(new Rectangle(32, 360, 256, 96), 
			{
				text : "Some multiline\nand readonly\ntext.",
				multiline : true,
				readonly : true
			}));
			
			var scrollingText:ScrollingText = new ScrollingText(new Rectangle(304, 360, 256, 96),
			{
				text: "scrollbox"
			});
			
			var inputBox:InputText = new InputText(new Rectangle(304, 320, 184, 32));
			uiEntity.AddGuiItem(inputBox);
			uiEntity.AddGuiItem(new Button(new Rectangle(496, 320, 64, 32), 
			{ 
				label: "VV",
				OnClick: function(button:Button):void 
				{
					scrollingText.AppendText(inputBox.GetText() + "\n");
				}
			}));
			
			uiEntity.AddGuiItem(scrollingText);
			
			
			
			FP.world.add(uiEntity);
		}
		
	}
}