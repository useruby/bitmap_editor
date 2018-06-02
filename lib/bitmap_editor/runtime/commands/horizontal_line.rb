class BitmapEditor
  class Runtime
    class HorizontalLine < Command
      param :x1, PositiveInteger
      param :x2, PositiveInteger
      param :y, PositiveInteger
      param :color, Color

      def execute(runtime)
        runtime.bitmap.draw(x1, y, x2, y, color)
      end
    end
  end
end
