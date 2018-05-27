class BitmapEditor
  class Runtime
    class VerticalLine < Command
      def execute(runtime)
        x, y1, y2 = @params[0..2].map(&:to_i)
        color = @params[3]

        runtime.bitmap.draw_vertical_line(x, y1, y2, color)
      end
    end
  end
end
