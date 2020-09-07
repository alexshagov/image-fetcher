require 'optparse'
require_relative 'lib/app'

class CLI
  Options = Struct.new(:file_path, :download_path)

  def self.parse(options)
    args = Options.new()

    opt_parser = OptionParser.new do |opts|
      opts.banner = "Usage: ruby cli.rb [options]"

      opts.on("-f", "--file=FILE", "File with image urls (path)") do |file_path|
        args.file_path = file_path
      end

      opts.on("-d", "--path=PATH", "Images download folder (path)") do |download_path|

        args.download_path = download_path
      end

      opts.on("-h", "--help", "Prints this help") do
        puts opts
        exit
      end
    end

    opt_parser.parse!(options)

    if args.file_path && args.download_path
      puts args
    else
      puts "Please, specify images file path and download path. Use -h for help"
      puts "Exiting ..."
      exit 1
    end
  end
end

CLI.parse ARGV
