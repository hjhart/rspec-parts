require 'spec_helper'

describe Rspec::Parts do
  it 'has a version number' do
    expect(Rspec::Parts::VERSION).not_to be nil
  end
end
