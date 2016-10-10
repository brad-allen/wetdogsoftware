class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
      t.references :profile, foreign_key: true
      t.references :group
      t.string :name
      t.string :description
      t.integer :page_order
      t.string :status
      t.string :group_visibility, default: 'read'
      t.string :connection_visibility, default: 'read'
      t.string :users_visibility, default: 'read'
      t.string :public_visibility, default: 'hidden'
      t.string :rating, default: 'unrated'
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
