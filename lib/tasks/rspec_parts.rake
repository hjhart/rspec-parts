require 'rspec/parts'

if defined?(RSpec)
  namespace :spec do
    desc 'Run part M of N specs'
    RSpec::Core::RakeTask.new(:part, :part, :groups) do |task, task_args|
      groups = task_args[:groups].to_i == 0 ? 4 : task_args[:groups].to_i
      part = (task_args[:part].to_i == 0 ? 1 : task_args[:part].to_i) - 1

      total_file_list = Rspec::Parts::FileList.from(glob: 'spec/*', groups: groups, part: part)
      total_file_list.exclude('spec/controllers/jasmine_fixture_generation/*.rb')

      task.rspec_opts = '--profile --tag ~nginx --format progress'
      task.pattern = total_file_list
    end
  end
end
