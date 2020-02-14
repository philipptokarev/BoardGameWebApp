require 'rails_helper'

RSpec.describe Game, type: :model do
  context 'validation test' do
    it 'ensure name presence' do
      game = Game.create(name: 'Scythe').save
      expect(game).to be_falsy
    end

    it 'ensure description presence' do
      game = Game.create(description: 'Some description').save
      expect(game).to be_falsy
    end

    it 'ensure image presence' do
      game = Game.create(image: 'image').save
      expect(game).to be_falsy
    end

    it 'should successfully save' do
      game = Game.create(name: 'Scythe', description: 'Some description', image: 'image').save
      expect(game).to be_truthy
    end
  end
end
