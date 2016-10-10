json.extract! conversation_member, :id, :conversation_id, :profile_id, :status, :created_by, :updated_by, :created_at, :updated_at
json.url conversation_member_url(conversation_member, format: :json)