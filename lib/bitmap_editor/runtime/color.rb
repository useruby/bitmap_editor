class BitmapEditor
  class Runtime
    class Color
      def initialize(color)
        @color = color
      end

      def invalid?
        @color.match(/^[A-Z]{1}$/).nil?
      end
    end
  end
end
