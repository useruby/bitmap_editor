class BitmapEditor
  class Runtime
    class CreateImage < Command
      param :width, PositiveInteger
      param :height, PositiveInteger

      def execute(runtime)
        runtime.bitmap = Bitmap.new(width, height)
      end
    end
  end
end
