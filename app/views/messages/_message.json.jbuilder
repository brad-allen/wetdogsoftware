json.extract! message, :id, :conversation_id, :profile_id, :content, :status, :created_by, :updated_by, :created_at, :updated_at
json.url message_url(message, format: :json)