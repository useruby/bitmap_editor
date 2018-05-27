class BitmapEditor
  class Runtime
    class SetPixel < Command
      def execute(runtime)
        x = @params[0].to_i
        y = @params[1].to_i
        color = @params[2]

        runtime.bitmap.set_pixel(x, y, color)
      end
    end
  end
end
