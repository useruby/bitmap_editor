class BitmapEditor
  class Runtime
    class Command
      def initialize(params)
        @params = params
      end
    end
  end
end

require 'bitmap_editor/runtime/create_image'
require 'bitmap_editor/runtime/clear_table'
require 'bitmap_editor/runtime/set_pixel'
require 'bitmap_editor/runtime/vertical_line'
require 'bitmap_editor/runtime/horizontal_line'
require 'bitmap_editor/runtime/show'
