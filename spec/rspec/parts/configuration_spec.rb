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

  describe '#file_list_exclusions' do
    it 'defaults to an empty array' do
      expect(Rspec::Parts.config.file_list_exclusions).to eq([])
    end

    it 'is configurable' do
      Rspec::Parts.configure do |config|
        config.file_list_exclusions = ['spec_helper.rb', 'spec/controllers/jasmine_fixture_generation/*.rb']
      end

      expect(Rspec::Parts.config.file_list_exclusions).to eq(['spec_helper.rb', 'spec/controllers/jasmine_fixture_generation/*.rb'])
    end
  end

  describe '#rspec_opts' do
    it 'defaults to nothing' do
      expect(Rspec::Parts.config.rspec_opts).to eq('')
    end

    it 'is configurable' do
      Rspec::Parts.configure do |config|
        config.rspec_opts = '--profile --tag ~nginx --format progress'
      end

      expect(Rspec::Parts.config.rspec_opts).to eq('--profile --tag ~nginx --format progress')
    end
  end
end
