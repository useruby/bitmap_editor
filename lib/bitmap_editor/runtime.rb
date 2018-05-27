require 'bitmap_editor/runtime/bitmap'
require 'bitmap_editor/runtime/command'
require 'bitmap_editor/runtime/invalid_command'

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

    attr_accessor :bitmap

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
  end
end
