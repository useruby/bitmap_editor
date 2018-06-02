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
      assert(subject.each_line.flatten.all? { |pixel| pixel == 'O' }, 'not all pixel set correctly')
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

      assert_equal(subject.pixel(1, 3), 'A')
    end
  end

  describe '#draw' do
    it 'draws vertical line' do
      subject.draw(2, 3, 2, 6, 'W')

      assert_equal(subject.pixel(2, 3), 'W')
      assert_equal(subject.pixel(2, 4), 'W')
      assert_equal(subject.pixel(2, 5), 'W')
      assert_equal(subject.pixel(2, 6), 'W')
    end

    it 'draws horizontal line' do
      subject.draw(3, 2, 5, 2, 'Z')

      assert_equal(subject.pixel(3, 2), 'Z')
      assert_equal(subject.pixel(4, 2), 'Z')
      assert_equal(subject.pixel(5, 2), 'Z')
    end
  end
end
