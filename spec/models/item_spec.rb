require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      user = User.create(name: 'Brian Yegon', email: 'cc@example.com', password: '123456')
      record = Item.new(
        name: 'Toys',
        amount: 100,
        author: user
      )
      expect(record).to be_valid
    end

    it 'is invalid without a name' do
      record = Item.new(
        amount: 100
      )
      expect(record).to_not be_valid
    end

    it 'is invalid without an amount' do
      record = Item.new(
        name: 'Toys'
      )
      expect(record).to_not be_valid
    end

    it 'is invalid with non-numeric amount' do
      record = Item.new(
        name: 'Toys',
        amount: 'not a number'
      )
      expect(record).to_not be_valid
    end

    it 'is invalid with amount less than or equal to zero' do
      record = Item.new(
        name: 'Toys',
        amount: 0
      )
      expect(record).to_not be_valid

      record.amount = -100
      expect(record).to_not be_valid
    end
  end
end
