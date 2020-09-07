# frozen_string_literal: true

require 'spec_helper'
require_relative '../../lib/models/file.rb'

RSpec.describe Models::File do
  subject { described_class.new(file_path) }
  let(:file_path) { File.join(File.expand_path('../fixtures', __dir__), 'images.txt') }

  describe '#new' do
    context 'when file does not exist' do
      let(:file_path) { '/invalid.txt' }

      it 'throws the error' do
        expect { subject }.to raise_error(/Specified file does not exist/)
      end
    end

    context 'when file is not .txt' do
      let(:file_path) { File.join(File.expand_path('../fixtures', __dir__), 'images.invalid') }

      it 'throws the error' do
        expect { subject }.to raise_error(/Specified file does not have txt extension/)
      end
    end
  end

  describe '#entries' do
    it 'returns lines Enumerator' do
      expect(subject.entries).to be_a(Enumerator)
    end
  end
end

