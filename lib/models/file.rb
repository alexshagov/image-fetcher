module Models
  class File
    def initialize(file_path)
      check_if_exist!(file_path)
      check_extension!(file_path)

      @file_path = file_path
    end

    def entries
      ::File.foreach(file_path)
    end

    private

    attr_reader :file_path

    def check_if_exist!(file_path)
      raise 'Specified file does not exist' unless ::File.file?(file_path)
    end

    def check_extension!(file_path)
      raise 'Specified file does not have txt extension' if ::File.extname(file_path) != '.txt'
    end

  end
end
