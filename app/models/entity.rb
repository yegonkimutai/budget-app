class Entity < ApplicationRecord
  belongs_to :user
  has_many :groups_entities
  has_many :groups, through: :groups_entities

  def self.show_trans
    order(created_at: :desc)
  end

  def self.calculate_sum
    sum(:amount)
  end
end
