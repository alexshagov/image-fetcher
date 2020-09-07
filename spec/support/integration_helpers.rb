# frozen_string_literal: true

require 'open3'

module IntegrationHelpers
  def run_app(arg:)
    chdir ||= File.expand_path('../..', __dir__)
    output, _status = Open3.capture2(
      {},
      "ruby cli.rb #{arg}",
      chdir: chdir
    )
    puts output
    output
  end
end
