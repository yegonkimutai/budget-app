class Group < ApplicationRecord
    belongs_to :user
    has_many :entities

    validates :name, presence: true
    validates :icon, presence: true

    def self.display_groups
        order(created_at: :desc)
    end
end
