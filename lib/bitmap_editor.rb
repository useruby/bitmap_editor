require 'bitmap_editor/interpreter'

class BitmapEditor
  PROVIDE_CORRECT_FILE = 'please provide correct file'.freeze

  attr_reader :script

  def run(file_name)
    return puts(PROVIDE_CORRECT_FILE) if file_name.nil?

    @script = File.read(file_name)

    Interpreter.new(script).execute
  rescue SystemCallError, IOError
    puts(PROVIDE_CORRECT_FILE)
  rescue Runtime::Error => error
    error.print_message
  end
end
