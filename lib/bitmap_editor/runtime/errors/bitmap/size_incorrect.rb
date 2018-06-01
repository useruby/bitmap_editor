class BitmapEditor
  class Runtime
    class Bitmap
      class SizeIncorrect < BitmapEditor::Runtime::Error
        def message
          'image size is incorrect'
        end
      end
    end
  end
end
