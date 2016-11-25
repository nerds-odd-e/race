# frozen_string_literal: true
Rails.application.routes.draw do
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)

  get '/big_screen', to: 'games#big_screen'
  post '/next', to: 'games#next'

  resources :players do
    member do
      put 'select_dice'
    end
  end

  get '/players/:id/:thrown', to: 'players#show'
end
