class CreateGroupMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :group_members do |t|
      t.references :group, foreign_key: true
      t.references :profile, foreign_key: true
      t.string :status
      t.integer :created_by
      t.integer :updated_by
      t.boolean :is_admin
      t.boolean :can_post
      t.boolean :can_add_events
      t.boolean :can_comment

      t.timestamps
    end
  end
end
