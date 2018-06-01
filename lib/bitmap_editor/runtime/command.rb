class BitmapEditor
  class Runtime
    class Command
      def self.param(name, type)
        @names ||= []
        @names << name unless @names.include?(name)

        define_method(name) do
          instance_variable_get(:"@#{name}")
        end

        define_method("#{name}=") do |value|
          value = type.new(value)

          raise IncorrectParameterType if value.invalid?

          instance_variable_set(:"@#{name}", value)
        end
      end

      def self.param_name_by_index(index)
        @names[index]
      end

      def self.number_of_params
        @names.nil? ? 0 : @names.size
      end

      def initialize(params)
        raise IncorrectNumberOfParameters if incorrect_number_of_params?(params)
        
        params&.each_with_index do |value, index|
          set_param_value(index, value)
        end
      end

      private

      def incorrect_number_of_params?(params)
        params_size = params.nil? ? 0 : params.size
        params_size != self.class.number_of_params
      end

      def set_param_value(index, value)
        send(:"#{self.class.param_name_by_index(index)}=", value)
      end
    end
  end
end

require 'bitmap_editor/runtime/types/color'
require 'bitmap_editor/runtime/types/positive_integer'

require 'bitmap_editor/runtime/commands/create_image'
require 'bitmap_editor/runtime/commands/clear_table'
require 'bitmap_editor/runtime/commands/set_pixel'
require 'bitmap_editor/runtime/commands/vertical_line'
require 'bitmap_editor/runtime/commands/horizontal_line'
require 'bitmap_editor/runtime/commands/show'
