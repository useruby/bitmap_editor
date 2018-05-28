class BitmapEditor
  class Runtime
    class MissingBitmap < StandardError
      def message
        'There is no image'
      end
    end
  end
end
