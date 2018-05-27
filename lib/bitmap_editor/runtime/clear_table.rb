class BitmapEditor
  class Runtime
    class ClearTable < Command
      def execute(runtime)
        runtime.bitmap = Bitmap.new(runtime.bitmap.width, runtime.bitmap.height)
      end
    end
  end
end
