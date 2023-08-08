class Entity < ApplicationRecord
  belongs_to :user
  has_many :groups_entities, dependent: :destroy
  has_and_belongs_to_many :groups

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }

  def self.show_trans
    order(created_at: :desc)
  end

  def self.calculate_sum
    sum(:amount)
  end
end
