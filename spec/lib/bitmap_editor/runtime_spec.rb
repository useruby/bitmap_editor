require 'minitest/autorun'

require 'bitmap_editor/runtime'

describe BitmapEditor::Runtime do
  describe '#start' do
    it 'raise an exception if command not in the list' do
      assert_raises(BitmapEditor::Runtime::InvalidCommand) do
        BitmapEditor::Runtime.new([[1, 'G', [1, 2, 3]]]).start
      end
    end

    it 'raise an exception if the first commant is "S"' do
      assert_raises(BitmapEditor::Runtime::MissingBitmap) do
        BitmapEditor::Runtime.new([[1, 'S']]).start
      end
    end
  end
end
