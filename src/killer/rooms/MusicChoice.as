package killer.rooms 
{
	import killer.game.AmbientSelectorButton;
	import killer.game.MusicSelectorButton;
	import menu.CambodiaLanding;
	import net.flashpunk.Entity;
	import net.flashpunk.Screen;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import flash.ui.Mouse;
	
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class MusicChoice extends World
	{
		[Embed(source = '../../../assets/killer/music_choice_screen.png')] public const BG:Class;
		public var bgImage:Image = new Image(BG);
		
		public var musicSelectorButton:MusicSelectorButton;
		public var ambientSelectorButton:AmbientSelectorButton;
		
		public function MusicChoice() 
		{			
			FP.screen.color = Colors.BLACK;
			// Center screen in window		
			//FP.width = 600;
			//FP.height = 400;
			//FP.screen = new Screen();				
			//FP.screen.x = (SuperGlobal.SCREEN_WIDTH - FP.width) / 2;
			//FP.screen.y = (SuperGlobal.SCREEN_HEIGHT - FP.height) / 2;				
		}
		
		override public function begin():void
		{
			bgImage.centerOO();
			add(new Entity(FP.halfWidth, FP.halfHeight, bgImage));
			
			add(musicSelectorButton = new MusicSelectorButton(293, 227));
			add(ambientSelectorButton = new AmbientSelectorButton(553, 227));
		}
		
		override public function update():void
		{
			// Return to menu
			if (Input.pressed(SuperGlobal.RETURN_KEY)) 
			{				
				// Return
				FP.world = new CambodiaLanding;
			}		
			
			// Cursor
			if (collidePoint('button', Input.mouseX, Input.mouseY))
			{
				Mouse.cursor = 'button';
			}
			else
			{
				Mouse.cursor = 'arrow';
			}
			
			super.update();
		}
		
	}

}