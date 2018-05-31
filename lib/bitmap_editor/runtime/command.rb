class BitmapEditor
  class Runtime
    class Command
      def self.param(name, type)
        @names ||= []
        @names << name

        define_method(name) do
          instance_variable_get(:"@#{name}")
        end

        define_method("#{name}=") do |value|
          if type == Integer
            raise IncorrectParameterType unless value.to_s.match(/\d/)
            
            value = value.to_i
          elsif type == Color
            raise IncorrectParameterType if Color.new(value).invalid?
          end

          instance_variable_set(:"@#{name}", value)
        end
      end

      def self.name_from_index(index)
        @names[index]
      end

      def initialize(params)
        params&.each_with_index do |value, index|
          set_param_value(index, value)
        end
      end

      private

      def set_param_value(index, value)
        send(:"#{self.class.name_from_index(index)}=", value)
      end
    end
  end
end

require 'bitmap_editor/runtime/color'
require 'bitmap_editor/runtime/create_image'
require 'bitmap_editor/runtime/clear_table'
require 'bitmap_editor/runtime/set_pixel'
require 'bitmap_editor/runtime/vertical_line'
require 'bitmap_editor/runtime/horizontal_line'
require 'bitmap_editor/runtime/show'
