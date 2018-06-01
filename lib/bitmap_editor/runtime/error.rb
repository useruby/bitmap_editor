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

require 'bitmap_editor/runtime/missing_bitmap'
require 'bitmap_editor/runtime/invalid_command'
require 'bitmap_editor/runtime/coordinate_out_of_range'
require 'bitmap_editor/runtime/incorrect_parameter_type'
require 'bitmap_editor/runtime/incorrect_number_of_parameters'
