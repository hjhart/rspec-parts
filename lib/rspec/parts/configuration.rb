module Rspec
  module Parts
    class Configuration
      attr_accessor :spec_directory_glob

      def initialize
        @spec_directory_glob = 'spec/*'
      end
    end
  end
end
