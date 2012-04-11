package freedombridge.worlds 
{
	import jui.Button;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Intro extends World
	{
		
		public function Intro() 
		{
			super();
			add(new Button(207, 200, Image.createRect(10, 10, Colors.WHITE), null, 1.2, null, null, true, null));		
			add(new Entity(300, 300, new Text("Click to continue.", 0, 0, { font: "Casual Encouter", color: Colors.WHITE })));
		}
		
		override public function update():void
		{
			super.update();
		}
		
		
	}

}