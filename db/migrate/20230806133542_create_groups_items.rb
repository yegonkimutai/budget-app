class CreateGroupsItems < ActiveRecord::Migration[7.0]
  def change
    create_table :groups_items do |t|
      t.references :group, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
