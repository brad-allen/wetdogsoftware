class CreateConversationMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :conversation_members do |t|
      t.references :conversation, foreign_key: true
      t.references :profile, foreign_key: true
      t.string :status
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
