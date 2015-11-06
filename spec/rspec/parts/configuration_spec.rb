require 'spec_helper'

describe Rspec::Parts::Configuration do
  describe '#spec_directory_glob' do
    it 'defaults to the spec directory' do
      expect(Rspec::Parts.config.spec_directory_glob).to eq('spec/*')
    end

    it 'is configurable' do
      Rspec::Parts.configure do |config|
        config.spec_directory_glob = 'test/*'
      end

      expect(Rspec::Parts.config.spec_directory_glob).to eq('test/*')
    end
  end
end
