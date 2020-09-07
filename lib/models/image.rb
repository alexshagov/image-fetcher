require 'open-uri'

module Models
  class Image
    attr_reader :url

    SUPPORTED_FORMATS = %w(jpg png).freeze

    def initialize(url)
      validate_image_extension!(url)

      @url = url
    end

    def download(to:)
      puts "Saving #{url} ..."

      IO.copy_stream(to, URI.open(url))
    end

    private

    def validate_image_extension!(url)
      error_message = "Invalid image extension. Supported formats are: #{SUPPORTED_FORMATS.join(',')}"
      raise error_message unless SUPPORTED_FORMATS.include?(url.split('.').last)
    end
  end
end
