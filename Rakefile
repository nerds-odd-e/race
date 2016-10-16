require_relative 'config/application'

Rails.application.load_tasks

require 'rubocop/rake_task'
RuboCop::RakeTask.new

namespace :stress do
  desc 'stress test for the site'
  task :test, [:player] do |_t, args|
    loop do
      url = "http://race.odd-e.com/race_players/#{args[:player]}/race_moves/"
      cmd = "wget --post-data=race_move[choice]=super --max-redirect 0 #{url}"
      p cmd
      system(cmd)
      sleep 1.0
    end
  end
end

task default: [:rubocop] unless Rails.env.production?
