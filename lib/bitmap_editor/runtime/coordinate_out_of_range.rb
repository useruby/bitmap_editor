class BitmapEditor
  class Runtime
    class CoordinateOutOfRange < Error
      def message
        'coordinate is out of range'
      end
    end
  end
end
