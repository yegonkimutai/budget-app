class Item < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :groups_item, dependent: :destroy
  has_many :groups, through: :groups_item

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }

  def self.show_trans
    order(created_at: :desc)
  end

  def self.calculate_sum
    sum(:amount)
  end
end
