class BitmapEditor
  class Runtime
    class InvalidCommand < StandardError
      def message
        'unrecognised command :('
      end
    end
  end
end
