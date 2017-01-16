Rails.application.routes.draw do
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  resources :race_games do
    member do
      post 'choose_first'
      get 'qr_code'
      get 'previous_tick'
    end
    resources :race_players, shallow: true do
      resources :race_moves, shallow: true
    end
  end
end
