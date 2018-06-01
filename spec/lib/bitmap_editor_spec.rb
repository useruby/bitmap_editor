require 'minitest/autorun'

require 'bitmap_editor'

describe BitmapEditor do
  let(:file_name) { 'examples/show.txt' }
  let(:input_file) { "I 5 6\nL 1 3 A\nV 2 3 6 W\nH 3 5 2 Z\nS\n" }
  let(:expected_output) { "OOOOO\nOOZZZ\nAWOOO\nOWOOO\nOWOOO\nOWOOO\n" }

  subject { BitmapEditor.new }

  describe '#run' do
    it 'reads script from the file' do
      capture_io { subject.run(file_name) }

      assert_equal(subject.script, input_file)
    end

    it 'outputs expected output' do
      assert_output(expected_output) do
        subject.run(file_name)
      end
    end

    describe 'error' do
      let(:file_name) { 'examples/error.txt'}
      let(:expected_output) { "Line 4 --> L 1 3 5 A <-- incorrect number of parameters\n" }

      it 'prints error message' do
        assert_output(expected_output) do
          subject.run(file_name)
        end
      end
    end
  end
end
