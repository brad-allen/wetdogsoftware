class CreateGroupActions < ActiveRecord::Migration[5.0]
  def change
    create_table :group_actions do |t|
      t.references :group, foreign_key: true
      t.references :profile, foreign_key: true
      t.string :action
      t.string :description
      t.string :group_visibility, default: 'read'
      t.string :connection_visibility, default: 'read'
      t.string :users_visibility, default: 'read'
      t.string :public_visibility, default: 'hidden'
      t.string :rating, default: 'unrated'
      t.string :status
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
