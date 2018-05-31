class BitmapEditor
  class Runtime
    class CreateImage < Command
      param :width, Integer
      param :height, Integer

      def execute(runtime)
        runtime.bitmap = Bitmap.new(width, height)
      end
    end
  end
end
