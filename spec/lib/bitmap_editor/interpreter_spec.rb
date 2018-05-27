require 'minitest/autorun'

require 'bitmap_editor/interpreter'

describe BitmapEditor::Interpreter do
  let(:script) { "I 5 6\nL 1 3 A\nV 2 3 6 W\nH 3 5 2 Z\nS" }

  subject { BitmapEditor::Interpreter.new(script) }

  describe '#parse' do
    it 'returns list of the commands' do
      assert(subject.parse.is_a?(Array), 'not list')
    end
  end
end
