Rails.application.routes.draw do
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)

  get "/big_screen", to: "games#big_screen"

  put "/players/:id/select_dice", to: "players#select_dice"
  resources :players
end
