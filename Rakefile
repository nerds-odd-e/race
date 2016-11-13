require_relative 'config/application'

Rails.application.load_tasks
Rake::Task[:default].prerequisites.insert 0, 'spec:javascript'

require 'rubocop/rake_task'
RuboCop::RakeTask.new
task default: [:rubocop] unless Rails.env.production?
