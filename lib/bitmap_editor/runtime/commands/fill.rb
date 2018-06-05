class BitmapEditor
  class Runtime
    class Fill < Command
      param :x, PositiveInteger
      param :y, PositiveInteger
      param :replacement_color, Color

      def execute(runtime)
        runtime.bitmap.fill(x, y, replacement_color)
      end
    end
  end
end
