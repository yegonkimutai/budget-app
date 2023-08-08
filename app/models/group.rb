class Group < ApplicationRecord
    self.table_name = 'groups'
    belongs_to :user
    has_many :groups_entities
    has_and_belongs_to_many :entities, join_table: 'groups_entities'

    validates :name, presence: true
    validates :icon, presence: true

    def self.display_groups
        order(created_at: :desc)
    end
end
