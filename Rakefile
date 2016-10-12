require_relative 'config/application'

Rails.application.load_tasks

require 'rubocop/rake_task'
RuboCop::RakeTask.new

unless Rails.env.production?
  task default: [:rubocop]
end
