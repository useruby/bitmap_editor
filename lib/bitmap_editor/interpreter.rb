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
      @script.split("\n").reject(&:empty?).map do |line|
        command, *params = line.split("\s")

        [command, params]
      end
    end
  end
end
