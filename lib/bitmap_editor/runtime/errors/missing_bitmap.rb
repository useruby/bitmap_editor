class BitmapEditor
  class Runtime
    class MissingBitmap < Error
      def message
        'There is no image'
      end
    end
  end
end
