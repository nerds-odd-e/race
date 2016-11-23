Rails.application.routes.draw do
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)

  get "/big_screen", to: "games#big_screen"

  resources :players do
    member do
      put "select_dice"
    end
  end

  get "/players/:id/:thrown", to: "players#show"

end
