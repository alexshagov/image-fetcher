require_relative 'models/file.rb'
require_relative 'models/image.rb'

class App
  def self.run(file_path:, download_path:)
    file = Models::File.new(file_path)

    threads = []
    file.entries.each do |image_url|
      threads << Thread.new(image_url) do
        Models::Image.new(image_url).download(to: download_path)
      end
    end
    threads.each(&:join)
  end
end
