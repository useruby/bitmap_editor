class BitmapEditor
  class Runtime
    class SetPixel < Command
      param :x, PositiveInteger
      param :y, PositiveInteger
      param :color, Color

      def execute(runtime)
        runtime.bitmap.set_pixel(x, y, color)
      end
    end
  end
end
