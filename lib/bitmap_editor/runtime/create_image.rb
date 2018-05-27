class BitmapEditor
  class Runtime
    class CreateImage < Command
      def execute(runtime)
        width, height = @params.map(&:to_i)

        runtime.bitmap = Bitmap.new(width, height)
      end
    end
  end
end
