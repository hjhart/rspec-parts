module Rspec
  module Parts
    class Configuration
      attr_accessor :spec_directory_glob
      attr_accessor :rspec_opts
      attr_accessor :file_list_exclusions

      def initialize
        @spec_directory_glob = 'spec/*'
        @rspec_opts = ''
        @file_list_exclusions = []
      end
    end
  end
end
