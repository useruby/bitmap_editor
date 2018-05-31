class BitmapEditor
  class Runtime
    class VerticalLine < Command
      param :x, Integer
      param :y1, Integer
      param :y2, Integer
      param :color, Color

      def execute(runtime)
        runtime.bitmap.draw_vertical_line(x, y1, y2, color)
      end
    end
  end
end
