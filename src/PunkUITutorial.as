package
{
	import net.flashpunk.World;
	
	import punk.ui.PunkButton;
	import punk.ui.PunkLabel;
	import punk.ui.PunkPasswordField;
	import punk.ui.PunkTextArea;
	import punk.ui.PunkTextField;
	import punk.ui.PunkToggleButton;
	
	public class PunkUITutorial extends World
	{
		public var button:PunkButton;
		
		public function PunkUITutorial()
		{
			super();
			
			button = new PunkButton(170, 300, 300, 140, "Press me");
			button.setCallbacks(onReleased, onPressed, onEnter, onExit);
			add(button);
			add(new PunkToggleButton(10, 40, 100, 25, false, "Toggle me"));
			add(new PunkLabel("Read me", 125, 10));
			add(new PunkTextField("Write something", 125, 40, 200));
			add(new PunkPasswordField(125, 70, 200));
			add(new PunkTextArea("You could write a book here!", 330, 10, 300, 228));
		}
		
		public function onReleased():void
		{
			button.label.text = "You released me!";
		}
		
		public function onPressed():void
		{
			button.label.text = "You pressed me!";
		}
		
		public function onEnter():void
		{
			button.label.text = "You touched me!";
		}
		
		public function onExit():void
		{
			button.label.text = "You stopped touching me!";
		}
	}
}