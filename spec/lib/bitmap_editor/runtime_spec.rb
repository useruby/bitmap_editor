require 'minitest/autorun'

require 'bitmap_editor/runtime'

describe BitmapEditor::Runtime do
  describe '#start' do
    it 'raise an exception if command not in the list' do
      assert_raises(BitmapEditor::Runtime::InvalidCommand) do
        BitmapEditor::Runtime.new([['G', [1, 2, 3]]]).start
      end
    end
  end
end
