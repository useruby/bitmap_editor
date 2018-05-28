class BitmapEditor
  class Runtime
    class InvalidCommand < Error
      def message
        'unrecognised command :('
      end
    end
  end
end
