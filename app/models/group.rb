class Group < ApplicationRecord
    belongs_to :user
    has_many :groups_entities
    has_many :entities, through: :groups_entities

    validates :name, presence: true
    validates :icon, presence: true

    def self.display_groups
        order(created_at: :desc)
    end
end
