require 'bitmap_editor/runtime/bitmap/size_incorrect'

class BitmapEditor
  class Runtime
    class Bitmap
      MAX_SIZE = (1..249)

      attr_reader :width, :height, :pixels

      def initialize(width, height)
        raise SizeIncorrect unless MAX_SIZE.cover?(width) && MAX_SIZE.cover?(height)

        @width = width
        @height = height
        @pixels = Array.new(width * height, 'O')
      end

      def set_pixel(x, y, color)
        @pixels[(y - 1) * width + (x - 1)] = color
      end

      def draw_vertical_line(x, y1, y2, color)
        (y1..y2).each { |y| set_pixel(x, y, color) }
      end

      def draw_horizontal_line(x1, x2, y, color)
        (x1..x2).each { |x| set_pixel(x, y, color) }
      end
    end
  end
end
