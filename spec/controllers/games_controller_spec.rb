require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  context 'GET #show' do
    it 'should successfully response' do
      game = create(:game)
      get :show, params: {id: game.id}
      response.successful?
    end
  end
end
