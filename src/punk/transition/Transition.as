package punk.transition
{
	import punk.transition.effects.*;
	import flash.display.*;
	import net.flashpunk.*;
	import net.flashpunk.graphics.*;
	
	/**
	 * @author GIT:		cjke 
	 * @author Mail:	cjke.7777@gmail.com
	 */
	public class Transition
	{
		// == Private Static Variables == //
		private static var _in:Effect;
		private static var _inWorldClass:*;
		private static var _inWorld:World;		
		private static var _out:Effect;
		private static var _outWorld:World;		
		private static var _tracked:String = "";

		
		public function Transition()
		{
		}
		
		/**
		 * Transition to the next world using an out effect and in effect
		 * @param	inWorld Can be class or the world itself
		 * @param	outEffect
		 * @param	inEffect
		 */
		public static function to(inWorld:*, outEffect:Effect, inEffect:Effect):void
		{
			// Link worlds
			_outWorld = FP.world;
			_inWorldClass = inWorld;
			
			// Create out effects
			_out = outEffect;			
			_out.onComplete = onOut;
			_out.active = true; // all effects are inactive by default
			
			// Prepare in effects
			_in = inEffect;
			_in.onComplete = onIn;
			
			_outWorld.add(_out);			
		}
		
		/**
		 * Called when the out effect is done
		 */
		private static function onOut():void 
		{
			// Remove the old effect from the world
			_outWorld.remove(_out);
			_out.active = false;
			
			// Set new world
			if(_inWorldClass is Class)
			{
				_inWorld = new _inWorldClass() as World;
				FP.world = _inWorld;
			}
			else if(_inWorldClass is World)
			{
				FP.world = _inWorld = _inWorldClass;
			}
			
			// Turn on in effect
			_in.active = true;
			_inWorld.add(_in);
		}
		
		/**
		 * Called when the in effect is done
		 */
		private static function onIn():void
		{
			_inWorld.remove(_in);
			_in.active = false;
		}
		
		/**
		 * If you want an effect to follow a certain entity. This
		 * needs to be a public property of the world. Pass in a
		 * string reference to the item. This applies to both the
		 * in and out world. 
		 * 
		 * If the entity isn't found at the time the effect is 
		 * rendered the effect will just use it's startX, startY
		 * @param	entity
		 */
		public static function track(entity:String):void
		{
			_tracked = entity;
		}
		
		/**
		 * Turn off tracking
		 */
		public static function untrack():void
		{
			_tracked = "";
		}		
		
		/**
		 * Find the reference to the currently tracked item
		 */
		public static function get tracked():String
		{
			return _tracked;
		}
		
	}

}