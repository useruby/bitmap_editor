require 'bitmap_editor/runtime'

class BitmapEditor
  class Interpreter
    def initialize(script)
      @script = script
    end

    def execute
      commands = parse

      Runtime.new(commands).start
    end

    def parse
      line_number = 0

      @script.split($/).map do |line|
        line_number += 1

        next if line.empty?

        command, *params = line.split("\s")

        [line_number, command, params]
      end.compact
    end
  end
end
