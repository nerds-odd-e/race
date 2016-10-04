Rails.application.routes.draw do
  resources :race_games do
    resources :race_players, shallow: true
  end
end
