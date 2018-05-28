require 'bitmap_editor/runtime/bitmap'
require 'bitmap_editor/runtime/command'
require 'bitmap_editor/runtime/error'

class BitmapEditor
  class Runtime
    COMMANDS = {
      'I' => BitmapEditor::Runtime::CreateImage,
      'C' => BitmapEditor::Runtime::ClearTable,
      'L' => BitmapEditor::Runtime::SetPixel,
      'V' => BitmapEditor::Runtime::VerticalLine,
      'H' => BitmapEditor::Runtime::HorizontalLine,
      'S' => BitmapEditor::Runtime::Show
    }.freeze

    attr_writer :bitmap

    def initialize(commands)
      @commands = commands
      @bitmap = nil
    end

    def start
      @commands.each do |command, params|
        COMMANDS
          .fetch(command) { raise(InvalidCommand) }
          .new(params)
          .execute(self)
      end
    end

    def bitmap
      raise MissingBitmap if @bitmap.nil?

      @bitmap
    end
  end
end
