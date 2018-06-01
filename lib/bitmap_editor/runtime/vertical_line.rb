class BitmapEditor
  class Runtime
    class VerticalLine < Command
      param :x, PositiveInteger
      param :y1, PositiveInteger
      param :y2, PositiveInteger
      param :color, Color

      def execute(runtime)
        runtime.bitmap.draw_vertical_line(x, y1, y2, color)
      end
    end
  end
end
