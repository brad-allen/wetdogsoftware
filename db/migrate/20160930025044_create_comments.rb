class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.references :profile, foreign_key: true
      t.references :comment_widget, foreign_key: true
      t.string :content
      t.integer :vote_score
      t.boolean :upvote
      t.boolean :downvote
      t.integer :flag_count
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
