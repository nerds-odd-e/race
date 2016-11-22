Rails.application.routes.draw do
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)

  put "/players/:id/select_dice", to: "players#select_dice"
  resources :players
end
