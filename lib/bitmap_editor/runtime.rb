require 'bitmap_editor/runtime/bitmap'
require 'bitmap_editor/runtime/command'
require 'bitmap_editor/runtime/error'

%w(types commands errors).each do |folder|
  Dir[File.join(File.dirname(__FILE__), 'runtime', folder, '**', '*.rb')].each do |file|
    require(file)
  end
end

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
      @commands.each do |line_number, command, params|
        begin
          COMMANDS
            .fetch(command) { raise(InvalidCommand) }
            .new(params)
            .execute(self)
        rescue Error => error
          raise error.class.new(line_number, command, params)
        end
      end
    end

    def bitmap
      raise MissingBitmap if @bitmap.nil?

      @bitmap
    end
  end
end
