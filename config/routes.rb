Rails.application.routes.draw do
  resources :race_games do
    member do
      post 'choose_first'
    end
    collection do
      get 'join_last'
    end
    resources :race_players, shallow: true do
      resources :race_moves, shallow: true
    end
  end
end
