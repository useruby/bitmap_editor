class BitmapEditor
  class Runtime
    class Show < Command
      def execute(runtime)
        puts(
          runtime.bitmap.pixels
            .each_slice(runtime.bitmap.width)
            .map(&:join)
            .join("\n")
        )
      end
    end
  end
end
