class Item < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :groups_items, dependent: :destroy
  has_many :groups, through: :groups_items

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
end
