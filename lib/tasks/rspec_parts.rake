require 'rspec/core/rake_task'
require 'rspec/parts'

if defined?(RSpec)
  namespace :spec do
    desc 'Run part M of N specs'
    RSpec::Core::RakeTask.new(:part, :part, :groups) do |task, task_args|
      config = Rspec::Parts.config

      groups = task_args[:groups].to_i == 0 ? config.default_number_of_parts : task_args[:groups].to_i
      part = (task_args[:part].to_i == 0 ? 1 : task_args[:part].to_i)
      part_index = part - 1

      puts "Running part #{part} of #{groups} groups"

      file_list = Rspec::Parts::FileList.from(dir_glob: config.spec_directory_glob, num_of_groups: groups, which_part: part_index)
      config.file_list_exclusions.each do |exclusion|
        file_list.exclude(exclusion)
      end

      task.rspec_opts = config.rspec_opts
      task.pattern = file_list
    end
  end
end
