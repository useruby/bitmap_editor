class BitmapEditor
  class Runtime
    class Error < StandardError
      def initialize(line_number = 0, command = '', params = [])
        params ||= []

        @line_number = line_number
        @command = ([command] + params).join("\s")
      end

      def print_message
        puts("Line #{@line_number} --> #{@command} <-- #{message}")
      end
    end
  end
end
