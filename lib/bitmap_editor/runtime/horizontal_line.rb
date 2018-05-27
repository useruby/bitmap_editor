class BitmapEditor
  class Runtime
    class HorizontalLine < Command
      def execute(runtime)
        x1, x2, y = @params[0..2].map(&:to_i)
        color = @params[3]

        runtime.bitmap.draw_horizontal_line(x1, x2, y, color)
      end
    end
  end
end
