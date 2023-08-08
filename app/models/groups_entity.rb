class GroupsEntity < ApplicationRecord
  self.table_name = 'groups_entities'
    belongs_to :group
    belongs_to :entity
  end