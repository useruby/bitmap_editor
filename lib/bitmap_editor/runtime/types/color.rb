class BitmapEditor
  class Runtime
    class Color < String
      def invalid?
        match(/^[A-Z]{1}$/).nil?
      end
    end
  end
end
