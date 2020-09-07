# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'CLI' do
  include IntegrationHelpers

  context 'with valid [-f] and [-d] arguments' do
    it 'suceeds without errors' do

    end
  end

  context 'when specified images file does not exist' do
    it 'prints the error message' do

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

