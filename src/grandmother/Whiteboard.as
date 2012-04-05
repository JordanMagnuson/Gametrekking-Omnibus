package grandmother  
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.geom.ColorTransform;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.ByteArray;
	import net.flashpunk.graphics.Canvas;
	import net.flashpunk.FP;
	import flash.display.BlendMode;
	import net.flashpunk.graphics.Stamp;

	public class Whiteboard extends Stamp 
	{
		public var clean:Boolean = false;
		
		private var _eraser:Bitmap;
		private var _matrix:Matrix;
		private var _colorTransform:ColorTransform;
		
		public function Whiteboard(source:Class, eraser:Class)
		{
			// ohhhh it's soooo super
			super(source);
			
			// create our brush
			_eraser = new Bitmap(FP.getBitmap(eraser));		

			// define member variables
			_matrix = new Matrix;
			_colorTransform = new ColorTransform;
		}
		
		public function erase(px:Number = 0, py:Number = 0, alphaMultiplier:Number = 1):void
		{
			// reset and translate the matrix
			_matrix.identity();
			_matrix.translate(px - _eraser.width * 0.5, py - _eraser.height * 0.5);
			
			// set the alpha multiplier to erase at
			_colorTransform.alphaMultiplier = alphaMultiplier;
			
			// draw to the source bitmapData
			source.draw(_eraser, _matrix, _colorTransform, BlendMode.ERASE);
		}
		
		/**
		 * 
		 * @param	alphaThreshold		The minimum alpha value that a pixel must have to be considered opaque.
		 * @return	The number of opaque pixels left on the whiteboard.
		 */
		public function checkOpaquePixels(alphaThreshold:Number = 0.25):uint
		{
			var tester:BitmapData = new BitmapData(source.width, source.height);
			var pt:Point = FP.zero;
			var rect:Rectangle = source.rect;
			var threshold:uint =  uint('0x' + int(alphaThreshold * 100) + '000000'); 
			var color:uint = 0x80FF0000;		// irrelevent, as we aren't replacing any pixels.
			var maskColor:uint = 0xFF000000;	// Only check transparency channel.
			var result:uint;
			
			result = tester.threshold(source, rect, pt, ">", threshold, color, maskColor, false);
			return result;
		}
		
		/**
		 * A fast function to check that the board is completely erased.
		 * @return	False if the board has any non-transparent pixels. Otherwise true.
		 */
		public function checkCompletelyErased():Boolean
		{
			var opaque:Rectangle = source.getColorBoundsRect(0xFF, 0xFF, false);
			if (opaque.width || opaque.height) 
				return false;
			return true;
		}
	}
}