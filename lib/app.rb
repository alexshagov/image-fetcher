class App
  def self.run(file_path:, download_path:)
    file = Models::File.new(file_path)
  end
end
