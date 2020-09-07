require 'open-uri'
require 'securerandom'

module Models
  class Image
    attr_reader :url

    SUPPORTED_FORMATS = %w(jpg png).freeze

    def initialize(url)
      validate_image_extension!(url)

      @url = url
    end

    def download(to:)
      download_path = ::File.join(to, generate_uniq_image_name)

      puts "Saving #{url} as #{download_path} ..."

      IO.copy_stream(URI.open(url), download_path)
    end

    private

    def generate_uniq_image_name
      SecureRandom.uuid + url.split('/').last
    end

    def validate_image_extension!(url)
      error_message = "Invalid image extension. Supported formats are: #{SUPPORTED_FORMATS.join(',')}"
      raise error_message unless SUPPORTED_FORMATS.include?(url.split('.').last)
    end
  end
end
