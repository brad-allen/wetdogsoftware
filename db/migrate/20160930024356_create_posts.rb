class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.references :profile, foreign_key: true
      t.references :group
      t.references :page
      t.string :group_visibility, default: 'hidden'
      t.string :connection_visibility, default: 'read'
      t.string :users_visibility, default: 'hidden'
      t.string :public_visibility, default: 'hidden'
      t.string :rating, default: 'unrated'
      t.string :post_type
      t.string :content
      t.string :image
      t.string :thumb_image
      t.string :status

      t.timestamps
    end
  end
end
