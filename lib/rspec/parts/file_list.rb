require 'rake/file_list'

# Grabbed from ActiveSupport
# activesupport/lib/active_support/core_ext/array/grouping.rb, line 60
class Array
  def in_groups(number, fill_with = nil)
    # size.div number gives minor group size;
    # size % number gives how many objects need extra accommodation;
    # each group hold either division or division + 1 items.
    division = size.div number
    modulo = size % number

    # create a new array avoiding dup
    groups = []
    start = 0

    number.times do |index|
      length = division + (modulo > 0 && modulo > index ? 1 : 0)
      groups << last_group = slice(start, length)
      last_group << fill_with if fill_with != false &&
        modulo > 0 && length == division
      start += length
    end

    if block_given?
      groups.each { |g| yield(g) }
    else
      groups
    end
  end
end

module Rspec
  module Parts
    class FileList
      def self.from(dir_glob: glob, num_of_groups: groups, which_part: part)
        total_file_list = Rake::FileList.new

        Dir.glob(dir_glob).each do |spec_directory|
          directory_file_list = Rake::FileList.new
          directory_file_list.add("#{spec_directory}/**/*_spec.rb")
          subset_of_directory_file_list = directory_file_list.to_a.in_groups(num_of_groups, false).at(which_part)
          total_file_list.add(subset_of_directory_file_list)
        end

        total_file_list
      end
    end
  end
end

