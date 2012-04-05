package killer.rooms 
{
	import killer.game.AmbientSelectorButton;
	import killer.game.MusicSelectorButton;
	import net.flashpunk.Entity;
	import net.flashpunk.Screen;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class MusicChoice extends World
	{
		[Embed(source = '../../../assets/killer/music_choice_screen.png')] public const BG:Class;
		public var bgImage:Image = new Image(BG);
		
		public function MusicChoice() 
		{
			// Center screen in window		
			FP.width = 600;
			FP.height = 400;
			//FP.screen = new Screen();				
			FP.screen.x = (SuperGlobal.SCREEN_WIDTH - FP.width) / 2;
			FP.screen.y = (SuperGlobal.SCREEN_HEIGHT - FP.height) / 2;				
		}
		
		override public function begin():void
		{
			FP.screen.color = Colors.BLACK;
			add(new Entity(0, 0, bgImage));
			
			add(new MusicSelectorButton(81, 128));
			add(new AmbientSelectorButton(341, 128));
		}
		
	}

}