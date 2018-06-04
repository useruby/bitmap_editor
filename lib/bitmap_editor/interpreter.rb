require 'bitmap_editor/runtime'

class BitmapEditor
  class Interpreter
    COMMENT_DELIMITER = '-'.freeze
    PARAMS_DELIMETER = "\s".freeze

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

        next if line.empty? || line.start_with?(COMMENT_DELIMITER)

        command, *params = line.split(PARAMS_DELIMETER)

        [line_number, command, params]
      end.compact
    end
  end
end
