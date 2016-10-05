Rails.application.routes.draw do
  resources :race_games do
    member do
      post 'choose_first'
    end
    resources :race_players, shallow: true do
      resources :race_moves, shallow: true
    end
  end
end
