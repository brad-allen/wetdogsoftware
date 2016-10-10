json.extract! user, :id, :account_id, :username, :status, :created_by, :updated_by, :avatar,  :gravatar_url, :permission, :created_at, :updated_at
json.url user_url(user, format: :json)