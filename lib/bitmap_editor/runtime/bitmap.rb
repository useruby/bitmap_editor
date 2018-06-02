class BitmapEditor
  class Runtime
    class Bitmap
      MAX_SIZE = (1..249)
      ORIGIN_POINT = 1

      attr_reader :width, :height

      def initialize(width, height)
        raise SizeIncorrect unless MAX_SIZE.cover?(width) && MAX_SIZE.cover?(height)

        @width = width
        @height = height
        @pixels = Array.new(width * height, 'O')
      end

      def pixel(x, y)
        @pixels[coordinate_to_index(x, y)]
      end
 
      def set_pixel(x, y, color)
        @pixels[coordinate_to_index(x, y)] = color
      end
  
      def draw(x1, y1, x2, y2, color)
        (y1..y2).each do |y|
          @pixels.fill(color, coordinate_to_index(x1, y)..coordinate_to_index(x2, y))
        end
      end

      def each_line
        (ORIGIN_POINT..height).to_a.map do |y|
          @pixels[coordinate_to_index(ORIGIN_POINT, y)..coordinate_to_index(width, y)]
        end
      end

      private

      def coordinate_to_index(x, y)
        raise CoordinateOutOfRange if x > width || y > height

        (y - ORIGIN_POINT) * width + (x - ORIGIN_POINT)
      end
    end
  end
end
