require 'minitest/autorun'

require 'bitmap_editor/runtime'

describe BitmapEditor::Runtime::SetPixel do
  let(:runtime) { BitmapEditor::Runtime.new([]) }

  describe '#execute' do
    before do
      BitmapEditor::Runtime::CreateImage.new([5, 6]).execute(runtime)
    end

    it 'raises an exception CoordinateOutOfRange' do
      assert_raises(BitmapEditor::Runtime::CoordinateOutOfRange) do
        BitmapEditor::Runtime::SetPixel.new([10, 5, 'E']).execute(runtime)
      end
    end
  end
end
