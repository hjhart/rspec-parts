module Rspec
  module Parts
    class Configuration
      attr_accessor :spec_directory_glob
      attr_accessor :rspec_opts
      attr_accessor :file_list_exclusions
      attr_accessor :default_number_of_parts

      def initialize
        @spec_directory_glob = 'spec/*'
        @rspec_opts = ''
        @file_list_exclusions = []
        @default_number_of_parts = 4
      end
    end
  end
end
