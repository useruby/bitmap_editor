class BitmapEditor
  class Runtime
    class SetPixel < Command
      param :x, Integer
      param :y, Integer
      param :color, Color

      def execute(runtime)
        runtime.bitmap.set_pixel(x, y, color)
      end
    end
  end
end
