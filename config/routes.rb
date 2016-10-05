Rails.application.routes.draw do
  resources :race_games do
    resources :race_players, shallow: true do
      resources :race_moves, shallow: true
    end
  end
end
