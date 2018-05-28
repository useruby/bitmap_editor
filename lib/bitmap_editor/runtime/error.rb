class BitmapEditor
  class Runtime
    class Error < StandardError
    end
  end
end

require 'bitmap_editor/runtime/missing_bitmap'
require 'bitmap_editor/runtime/invalid_command'
require 'bitmap_editor/runtime/coordinate_out_of_range'
