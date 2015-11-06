require 'rails/railtie'

module Rspec
  module Parts
    class Railtie < Rails::Railtie
      rake_tasks do
        load 'tasks/rspec_parts.rake'
      end
    end
  end
end
