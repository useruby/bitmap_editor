require 'bitmap_editor/interpreter'

class BitmapEditor
  attr_reader :script

  def run(file_name)
    @script = File.read(file_name)

    Interpreter.new(script).execute
  end
end