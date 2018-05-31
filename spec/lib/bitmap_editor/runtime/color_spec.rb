require 'minitest/autorun'

require 'bitmap_editor/runtime/color'

describe BitmapEditor::Runtime::Color do
  describe '#invalid?' do
    it { assert(BitmapEditor::Runtime::Color.new('1').invalid?) }
    it { assert(BitmapEditor::Runtime::Color.new('z').invalid?) }
    it { assert(BitmapEditor::Runtime::Color.new('ZZ').invalid?) }
  end
end
