class CreateGroupInvites < ActiveRecord::Migration[5.0]
  def change
    create_table :group_invites do |t|
      t.references :group, foreign_key: true
      t.references :profile, foreign_key: true
      t.string :status
      t.datetime :invited_at
      t.datetime :reinvited_at
      t.datetime :rejected_at
      t.datetime :accepted_at
      t.datetime :approved_at
      t.integer :approved_by      
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
