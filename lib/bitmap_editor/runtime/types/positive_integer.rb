class BitmapEditor
  class Runtime
    class PositiveInteger < Numeric
      def initialize(value)
        @value = value.to_i
      end

      def <=>(other)
        @value <=> other
      end

      def *(other)
        @value * other
      end

      def -(other)
        @value - other
      end

      def coerce(other)
        [other, @value]
      end

      def to_i
        @value
      end

      def invalid?
        @value.negative? || @value.zero?
      end
    end
  end
end
