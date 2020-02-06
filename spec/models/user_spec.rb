require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation test' do
    it 'ensure name presence and truthly password' do
      user = User.create(name: 'John', password: '123456').save
      expect(user).to be_falsy
    end

    it 'ensure surname presence and truthly password' do
      user = User.create(surname: 'Johnson', password: '123456').save
      expect(user).to be_falsy
    end

    it 'will successfully save' do
      user = User.create(login: 'jj17', password: '123456').save
      expect(user).to be_truthy
    end

    it 'ensure name presence and wrong password' do
      user = User.create(name: 'John', password: '12345').save
      expect(user).to be_falsy
    end

    it 'ensure surname presence and wrong password' do
      user = User.create(surname: 'Johnson', password: '12345').save
      expect(user).to be_falsy
    end

    it 'ensure login presence and wrong password' do
      user = User.create(login: 'jj17', password: '12345').save
      expect(user).to be_falsy
    end
  end
end
