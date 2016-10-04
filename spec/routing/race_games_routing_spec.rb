require 'rails_helper'

RSpec.describe RaceGamesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/race_games').to route_to('race_games#index')
    end

    it 'routes to #new' do
      expect(get: '/race_games/new').to route_to('race_games#new')
    end

    it 'routes to #show' do
      expect(get: '/race_games/1').to route_to('race_games#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/race_games/1/edit').to route_to('race_games#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/race_games').to route_to('race_games#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/race_games/1').to route_to('race_games#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/race_games/1').to route_to('race_games#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/race_games/1').to route_to('race_games#destroy', id: '1')
    end
  end
end
