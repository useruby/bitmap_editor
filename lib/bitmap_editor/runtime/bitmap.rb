class BitmapEditor
  class Runtime
    class Bitmap
      MAX_SIZE = (1..250)
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
        delta_x = x2 - x1
        delta_y = y2 - y1

        decision = 0

        if (delta_x > delta_y)
          decision = 2 * delta_y - delta_x
    
          y = y1

          (x1..x2).each do |x|
            set_pixel(x, y, color)

            if decision < 0
              decision += 2 * delta_y
            else
              y += 1 
              decision -= 2 * delta_x
            end
          end
        else
          decision = 2 * delta_x - delta_y
   
          x = x1

          (y1..y2).each do |y|
            set_pixel(x, y, color)

            if decision < 0
              decision += 2 * delta_x
            else
              x += 1
              decision -= 2 * delta_y
            end
          end
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
