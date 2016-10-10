class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :profile_name
      t.string :first_name
      t.string :last_name
      t.string :unique_name      
      t.string :profile_responsibility_date
      t.string :status
      t.string :avatar
      t.string :gravatar_url
      t.string :bio
      t.string :state
      t.string :country
      t.string :tagline
      t.string :theme_music
      t.datetime :birth_date
      t.string :email
      t.boolean :require_connection_approval, default: true
      t.boolean :require_conversation_approval, default: true
      t.boolean :require_group_approval, default: true
      t.boolean :require_post_approval, default: true
      t.boolean :require_comment_approval, default: true
      t.boolean :can_view_non_connection_posts, default: false
      t.boolean :show_comments, default: false
      t.boolean :show_votes, default: true
      t.boolean :inform_user_of_actions, default: true
      t.boolean :allow_commenting, default: false
      t.boolean :allow_voting, default: true
      t.boolean :allow_emails, default: false
      t.string :group_visibility, default: 'read'
      t.string :connection_visibility, default: 'read'
      t.string :users_visibility, default: 'read'
      t.string :public_visibility, default: 'hidden'
      t.string :rating, default: 'unrated'
      t.string :allowed_rating, default: 'G'
      t.string :permission
      t.integer :created_by
      t.integer :updated_by
      t.timestamps
    end
  end
end
