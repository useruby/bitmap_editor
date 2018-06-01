class BitmapEditor
  class Runtime
    class Error < StandardError
    end
  end
end

require 'bitmap_editor/runtime/missing_bitmap'
require 'bitmap_editor/runtime/invalid_command'
require 'bitmap_editor/runtime/coordinate_out_of_range'
require 'bitmap_editor/runtime/incorrect_parameter_type'
require 'bitmap_editor/runtime/incorrect_number_of_parameters'
