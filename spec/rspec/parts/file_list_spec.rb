require 'spec_helper'

describe Rspec::Parts::FileList do
  describe '.from' do
    let(:subject) { described_class.from(glob: directory_glob, groups: 2, part: part) }

    context 'given a directory with two files in two directories' do
      let(:directory_glob) { 'spec/*' }

      context 'part one' do
        let(:part) { 0 }
        it 'splits the controllers and models directory appropriately' do
          filelist = subject.to_a
          aggregate_failures do
            expect(filelist).to include('spec/controllers/a_spec.rb')
            expect(filelist).to include('spec/models/a_spec.rb')
            expect(filelist).to include('spec/rspec/parts/file_list_spec.rb')
            expect(filelist).to include('spec/rspec/parts/configuration_spec.rb')
          end
        end
      end

      context 'part two' do
        let(:part) { 1 }
        it 'splits the controllers and models directory appropriately' do
          filelist = subject.to_a
          aggregate_failures do
            expect(filelist).to include('spec/controllers/b_spec.rb')
            expect(filelist).to include('spec/models/b_spec.rb')
            expect(filelist).to include('spec/rspec/parts_spec.rb')
          end
        end
      end
    end
  end
end
