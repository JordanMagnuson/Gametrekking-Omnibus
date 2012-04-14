package killer.game 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.FP;
	import killer.rooms.MyWorld;
	import killer.rooms.MusicChoice;
	import punk.transition.Transition;
	
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class AmbientSelectorButton extends Entity
	{
		public var image:Image = Image.createRect(179, 93, Colors.OFF_WHITE);
		
		public function AmbientSelectorButton(x:Number, y:Number) 
		{
			super(x, y, image);
			image.alpha = 0.5;
			image.visible = false;
			setHitboxTo(image);
			layer = 100;
			type = 'button';
		}
		
		override public function update():void
		{
			if (collidePoint(x, y, Input.mouseX, Input.mouseY))
			{
				image.visible = true;
				if (Input.mousePressed)
				{
					Global.MUSIC_WHILE_WALKING = false;
					//Global.server.sendMusicChoice();
					//FP.world = new MyWorld;
					punk.transition.Transition.to(MyWorld, new SuperGlobal.TRANS_OUT(SuperGlobal.TRANS_OUT_OPTIONS), new SuperGlobal.TRANS_IN(SuperGlobal.TRANS_IN_OPTIONS));
				}
			}
			else
			{
				image.visible = false;
			}
		}
		
	}

}