class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.references :profile, foreign_key: true
      t.string :description
      t.string :status
      t.integer :created_by
      t.integer :updated_by
      t.string :group_visibility, default: 'hidden'
      t.string :connection_visibility, default: 'read'
      t.string :users_visibility, default: 'hidden'
      t.string :public_visibility, default: 'hidden'
      t.string :rating, default: 'unrated'
      t.string :group_type

      t.timestamps
    end
  end
end
