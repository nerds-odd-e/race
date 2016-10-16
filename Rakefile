require_relative 'config/application'

Rails.application.load_tasks

require 'rubocop/rake_task'
RuboCop::RakeTask.new

namespace :stress do
  desc 'stress test for the site'
  task :request, [:player] do |t, args|
    cmd = "wget --post-data=race_move[choice]=super --max-redirect 0 http://race.odd-e.com/race_players/#{args[:player]}/race_moves/"
    p cmd
    system(cmd)
    p "done"
    true
  end

  task :player, [:player] do |t, args|
    while true
      cmd = "wget --post-data=race_move[choice]=super --max-redirect 0 http://race.odd-e.com/race_players/#{args[:player]}/race_moves/"
      p cmd
      system(cmd)
      sleep 1.0
    end
  end
end

task default: [:rubocop] unless Rails.env.production?
