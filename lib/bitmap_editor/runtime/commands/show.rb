class BitmapEditor
  class Runtime
    class Show < Command
      def execute(runtime)
        puts(
          runtime
            .bitmap
            .each_line
            .map(&:join)
            .join($/)
        )
      end
    end
  end
end
