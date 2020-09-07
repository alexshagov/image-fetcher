# frozen_string_literal: true

require 'spec_helper'
require_relative '../../lib/models/image.rb'

RSpec.describe Models::Image do
  subject { described_class.new(url) }

  let(:url) { 'https://site.com/image.jpg' }
  let(:download_path) { '/tmp/image-fetcher/downloads/' }
  let(:downloaded_resource_double) { double }
  let(:uniq_image_salt) { '123' }
  let(:expected_download_path) do
    download_path + uniq_image_salt + 'image.jpg'
  end

  describe '#download' do
    before do
      allow(URI).to receive(:open).with(url).and_return(downloaded_resource_double)
      allow(SecureRandom).to receive(:uuid).and_return(uniq_image_salt)
    end

    context 'when image extension is invalid' do
      let(:url) { 'https://google.com/image.invalid' }

      it 'raises the error' do
        expect { subject }.to raise_error(/Invalid image extension/)
      end
    end

    it 'downloads the file' do
      expect(IO).to receive(:copy_stream).with(downloaded_resource_double, expected_download_path)

      subject.download(to: download_path)
    end
  end
end

