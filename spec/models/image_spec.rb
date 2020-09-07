# frozen_string_literal: true

require 'spec_helper'
require_relative '../../lib/models/image.rb'

RSpec.describe Models::Image do
  subject { described_class.new(url) }

  let(:url) { 'https://site.com/image.jpg' }
  let(:download_path) { '/tmp/image-fetcher/downloads' }
  let(:downloaded_resource_double) { double }

  describe '#download' do
    before do
      allow(URI).to receive(:open).with(url).and_return(downloaded_resource_double)
    end

    context 'when image extension is invalid' do
      let(:url) { 'https://google.com/image.invalid' }

      it 'raises the error' do
        expect { subject }.to raise_error(/Invalid image extension/)
      end
    end

    it 'downloads the file' do
      expect(IO).to receive(:copy_stream).with(download_path, downloaded_resource_double)

      subject.download(to: download_path)
    end
  end
end

