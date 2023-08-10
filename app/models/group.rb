class Group < ApplicationRecord
  belongs_to :user
  has_many :groups_item
  # has_and_belongs_to_many :entities, join_table: 'groups_entities'
  has_many :items, through: :groups_item

  validates :name, presence: true
  validates :icon, presence: true

  def self.display_groups
    order(created_at: :desc)
  end

  def total_value
    items.sum(:amount)
  end
end
