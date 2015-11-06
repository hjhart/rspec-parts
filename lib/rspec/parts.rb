require "rspec/parts/version"
require "rspec/parts/configuration"

module Rspec
  module Parts
    class << self
      attr_writer :config
    end

    def self.config
      @configuration ||= Configuration.new
    end

    def self.configure
      yield(config)
    end
  end
end

if defined?(Rails) && Rails.respond_to?(:version)
  require File.join('rspec', 'parts', 'railtie')
end
