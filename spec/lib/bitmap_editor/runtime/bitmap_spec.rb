require 'minitest/autorun'

require 'bitmap_editor/runtime/bitmap'

describe BitmapEditor::Runtime::Bitmap do
  subject { BitmapEditor::Runtime::Bitmap.new(5, 6) }

  describe '#new' do
    it 'creates bitmap with width equal 5' do
      assert_equal(subject.width, 5)
    end

    it 'creates bitmap with height equal 6' do
      assert_equal(subject.height, 6)
    end

    it 'fill all the pixels with O' do
      assert(subject.pixels.all? { |pixel| pixel == 'O' }, 'not all pixel set correctly')
    end

    it 'raise an exception if width is greater than maximum size' do
      assert_raises(BitmapEditor::Runtime::Bitmap::SizeIncorrect) do
        BitmapEditor::Runtime::Bitmap.new(300, 6)
      end
    end

    it 'raise an exception if height is greater than maximum size' do
      assert_raises(BitmapEditor::Runtime::Bitmap::SizeIncorrect) do
        BitmapEditor::Runtime::Bitmap.new(5, 600)
      end
    end

    it 'raise an exception if width or height is less than origin' do
      assert_raises(BitmapEditor::Runtime::Bitmap::SizeIncorrect) do
        BitmapEditor::Runtime::Bitmap.new(-10, 0)
      end
    end
  end

  describe '#set_pixel' do
    it 'fills pixel with color' do
      subject.set_pixel(1, 3, 'A')

      assert_equal(subject.pixels[10], 'A')
    end
  end

  describe '#vertical_line' do
    it 'draws vertical line' do
      subject.draw_vertical_line(2, 3, 6, 'W')

      assert_equal(subject.pixels[11], 'W')
      assert_equal(subject.pixels[16], 'W')
      assert_equal(subject.pixels[21], 'W')
      assert_equal(subject.pixels[26], 'W')
    end
  end

  describe '#horizontal_line' do
    it 'draws horizontal line' do
      subject.draw_horizontal_line(3, 5, 2, 'Z')

      assert_equal(subject.pixels[7], 'Z')
      assert_equal(subject.pixels[8], 'Z')
      assert_equal(subject.pixels[9], 'Z')
    end
  end
end
