# frozen_string_literal: true

require 'spec_helper'
require 'fileutils'

RSpec.describe 'CLI' do
  include IntegrationHelpers

  let(:file_path) { File.join(File.expand_path('../fixtures', __dir__), 'images.txt') }
  let(:download_path) { File.join(File.expand_path('../fixtures/tmp', __dir__)) }

  context 'with valid [-f] and [-d] arguments' do
    around do |ex|
      FileUtils.rm_f Dir[File.join(download_path, '**', '*')]
      ex.run
    end

    it 'downloads images from the sample file' do
      run_app(arg: "-f #{file_path} -d #{download_path}")
      expect(Dir[File.join(download_path, '**', '*')].length).to eq 3
    end
  end

  context '[-h] help command' do
    it 'prints help' do
      expect(run_app(arg: '-h')).to include('Usage: ruby cli.rb')
    end
  end

  context 'with no arguments' do
    it 'prints the warning message' do
      expect(run_app(arg: nil)).to include('Please, specify images file path and download path. Use -h for help')
    end
  end
end
