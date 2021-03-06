module Jekyll
  module MultipleLanguagePluginTools
    class TestTools < Minitest::Test

      def test_delete_from_array
        static_files  = ['file.jpeg', 'file.txt', '/relative_path.pdf'].map{|value| Pathname.new(value)}
        static_files.delete_if do |static_file|
          RemoverStaticFiles.go static_file, ['file.jpeg']
        end
        assert_equal static_files, ['file.txt', '/relative_path.pdf'].map{|value| Pathname.new(value)}
      end

      def test_path_are_the_same
        equivalent_tool = PathEquivalent.new('file.rb', Pathname.new('file.rb'))
        assert equivalent_tool.check
      end

    end
  end
end
