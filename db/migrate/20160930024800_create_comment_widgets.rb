class CreateCommentWidgets < ActiveRecord::Migration[5.0]
  def change
    create_table :comment_widgets do |t|
      t.references :post, foreign_key: true
      t.boolean :allow_api_access
      t.string :description
      t.integer :current_score
      t.integer :commenter_count
      t.integer :voter_count
      t.string :status
      t.string :group_visibility, default: 'read'
      t.string :connection_visibility, default: 'read'
      t.string :users_visibility, default: 'read'
      t.string :public_visibility, default: 'hidden'
      t.string :rating, default: 'unrated'
      t.integer :widget_style_id
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
