require "rspec/parts/version"

module Rspec
  module Parts
  end
end

if defined?(Rails) && Rails.respond_to?(:version)
  require File.join('rspec', 'parts', 'railtie')
end
