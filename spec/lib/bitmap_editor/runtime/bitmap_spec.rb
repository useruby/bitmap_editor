require 'minitest/autorun'

require 'bitmap_editor/runtime/bitmap'

def assert_all_color(color)
  assert(
    subject.each_line.flatten.all? { |pixel| pixel == color }, 
    'not all pixel set correctly'
  )
end

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
      assert_all_color('O')
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

      (3..6).each { |y| assert_equal(subject.pixel(2, y), 'W') }
    end

    it 'draws horizontal line' do
      subject.draw(3, 2, 5, 2, 'Z')

      (3..5).each { |x| assert_equal(subject.pixel(x, 2), 'Z') }
    end

    it 'draws diagonal line' do
      subject.draw(1, 2, 4, 3, 'D')

      assert_equal(subject.pixel(1, 2), 'D')
      assert_equal(subject.pixel(2, 2), 'D')
      assert_equal(subject.pixel(3, 3), 'D')
      assert_equal(subject.pixel(4, 3), 'D')
      assert_equal(subject.pixel(3, 2), 'O')
      assert_equal(subject.pixel(4, 2), 'O')
      assert_equal(subject.pixel(1, 3), 'O')
      assert_equal(subject.pixel(2, 3), 'O')
    end
  end

  describe '#fill' do
    it 'fills whole image with A' do
      subject.fill(1,1, 'A')
      
      assert_all_color('A')
    end

    it 'changes color for horizontal line from B to A' do
      subject.draw(1, 1, 5, 1, 'B')

      subject.fill(1, 1, 'A')

      (1..5).each { |x| assert_equal('A', subject.pixel(x, 1)) }
    end

    it 'fills top line with A when second line is B' do
      subject.draw(1, 2, 5, 2, 'B')

      subject.fill(1, 1, 'A')

      (1..5).each { |x| assert_equal('A', subject.pixel(x, 1)) }
      (1..5).each { |x| assert_equal('B', subject.pixel(x, 2)) }
    end

    it "doesn't fill the pixel that on diagonal from the target" do
      subject.set_pixel(1, 1, 'A')
      subject.set_pixel(2, 2, 'A')

      subject.fill(1, 1, 'B')

      assert_equal('B', subject.pixel(1, 1))
      assert_equal('A', subject.pixel(2, 2))
    end
  end
end
