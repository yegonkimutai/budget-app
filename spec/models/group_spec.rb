require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      user = User.create(name: 'Brian Yegon', email: 'bb@example.com', password: 'qwerty')
      group = Group.new(
        name: 'Metal Shopping',
        icon: 'https://example.com/icon.png',
        user:
      )
      expect(group).to be_valid
    end

    it 'is invalid without a name' do
      group = Group.new(
        icon: 'https://example.com/icon.png'
      )
      expect(group).to_not be_valid
    end

    it 'is invalid without an icon' do
      group = Group.new(
        name: 'Metal Shopping'
      )
      expect(group).to_not be_valid
    end
  end

  describe '#total_amount' do
    it 'returns the sum of record amounts for the group' do
      user = User.create(name: 'Brian Yegon', email: 'bb@example.com', password: 'qwerty')
      group = Group.create(name: 'Metal Shopping', icon: 'https://example.com/icon.png', user:)

      # Create some records associated with the group
      item1 = Item.create(name: 'Bolts', amount: 2.5, author: user)
      item2 = Item.create(name: 'Screws', amount: 3.0, author: user)

      # Associate the records with the group
      group.items << item1
      group.items << item2

      # Calculate the total amount
      total_value = item1.amount + item2.amount

      expect(group.total_value).to eq(total_value)
    end
  end
end