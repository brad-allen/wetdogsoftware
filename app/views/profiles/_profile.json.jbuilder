json.extract! profile, :id, :user_id, :profile_name, :first_name, :last_name, :status, :created_by, :updated_by, :avatar, :require_connection_approval, :require_conversation_approval, :require_group_approval, :require_post_approval, 
:require_comment_approval, :can_view_non_connection_posts, :show_comments, :show_votes, :inform_user_of_actions, :allow_commenting, :allow_voting, :bio, :state, :country, :tagline, :theme_music, :birth_date, :email, :permission, :allow_all_connections, :allow_emails, :allow_all_conversations, :inform_user_of_actions, :allow_all_groups, :connection_visibility, :profile_responsibility_date, :unique_name:gravatar_url, :allowed_rating, :created_at, :updated_at
json.url profile_url(profile, format: :json)

