require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  context 'GET #new' do
    it 'returns a success response' do
      get :new
      response.successful?
    end
  end

  context 'GET #show' do
    it 'returns a success response' do
      user = User.create!(login: 'jj17', password: '123456')
      get :show, params:{ id: user.id }
      response.successful?
    end
  end
end
