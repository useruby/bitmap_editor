class BitmapEditor
  class Runtime
    class HorizontalLine < Command
      param :x1, Integer
      param :x2, Integer
      param :y, Integer
      param :color, Color

      def execute(runtime)
        runtime.bitmap.draw_horizontal_line(x1, x2, y, color)
      end
    end
  end
end
