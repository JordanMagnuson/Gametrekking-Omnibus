package statusquo 
{
	import menu.Global;
	import menu.TaiwanLanding;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.World;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import punk.transition.Transition
	
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class Explanation extends World
	{
		[Embed(source = "../../assets/statusquo/explanation.png")] public static const EXPLANATION:Class;
		public var backdrop:Backdrop = new Backdrop(EXPLANATION);
		
		public function Explanation() 
		{
			add(new Entity(0, 0, backdrop));
		}
		
		override public function update():void
		{
			super.update();
			
			if (Input.pressed(Key.ESCAPE)) 
			{
				var goto:World = new TaiwanLanding;
				Transition.to(goto, new Global.TRANS_OUT(Global.TRANS_OUT_OPTIONS), new Global.TRANS_IN(Global.TRANS_IN_OPTIONS)); 
			}
		}		
		
	}

}