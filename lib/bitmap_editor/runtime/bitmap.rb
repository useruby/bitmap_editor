class BitmapEditor
  class Runtime
    class Bitmap
      MAX_SIZE = (1..249)
      ORIGIN_POINT = 1

      attr_reader :width, :height, :pixels

      def initialize(width, height)
        raise SizeIncorrect unless MAX_SIZE.cover?(width) && MAX_SIZE.cover?(height)

        @width = width
        @height = height
        @pixels = Array.new(width * height, 'O')
      end

      def set_pixel(x, y, color)
        raise CoordinateOutOfRange if x > width || y > height

        @pixels[(y - ORIGIN_POINT) * width + (x - ORIGIN_POINT)] = color
      end

      def draw_vertical_line(x, y1, y2, color)
        (y1.to_i..y2.to_i).each { |y| set_pixel(x, y, color) }
      end

      def draw_horizontal_line(x1, x2, y, color)
        (x1.to_i..x2.to_i).each { |x| set_pixel(x, y, color) }
      end
    end
  end
end
