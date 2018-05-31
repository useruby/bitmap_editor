require 'minitest/autorun'

require 'bitmap_editor/runtime/command'

describe BitmapEditor::Runtime::Command do
  let(:kung_fu_command) do
    class BitmapEditor::Runtime::KungFuCommand < BitmapEditor::Runtime::Command
      param :one, Integer
      param :color, BitmapEditor::Runtime::Color
    end

    BitmapEditor::Runtime::KungFuCommand
  end

  describe '.new' do
    it 'creates new instance where parameter one will equal to 1' do
      assert_equal(kung_fu_command.new(['1']).one, 1)
    end

    it 'creates new instance where parameter color will equal to W' do
      assert_equal(kung_fu_command.new(['1', 'W']).color, 'W')
    end

    it 'raises an exception if first parameter is color' do
      assert_raises(BitmapEditor::Runtime::IncorrectParameterType) do
        kung_fu_command.new(['W', 'W'])
      end
    end

    it 'raises an exception if second parameter is digit' do
      assert_raises(BitmapEditor::Runtime::IncorrectParameterType) do
        kung_fu_command.new(['1', '2'])
      end
    end
  end
end
