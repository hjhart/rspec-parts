require 'rails/railtie'

module Rspec
  module Parts
    class Railtie < Rails::Railtie
      rake_tasks do
        load 'tasks/rspec_parts.rake'
      end

      config.before_configuration do
        configuration = ::Rails.root.join('spec', 'support', 'rspec-parts.rb')
        if File.exists?(configuration)
          require configuration
        end
      end
    end
  end
end
