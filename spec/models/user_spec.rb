require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      user = User.new(
        name: 'Brian Yegon',
        email: 'aa@example.com',
        password: '123456'
      )
      expect(user).to be_valid
    end

    it 'is invalid without a name' do
      user = User.new(
        email: 'aa@example.com',
        password: '123456'
      )
      expect(user).to_not be_valid
    end

    it 'is invalid without an email' do
      user = User.new(
        name: 'Brian Yegon',
        password: '123456'
      )
      expect(user).to_not be_valid
    end

    it 'is invalid without a password' do
      user = User.new(
        name: 'Brian Yegon',
        email: 'aa@example.com'
      )
      expect(user).to_not be_valid
    end
  end
end