json.extract! conversation_invite, :id, :conversation_id, :profile_id, :invited_profile_id, :status, :invited_at, :reinvited_at, :rejected_at, :accepted_at, :approved_at, :approved_by, :created_by, :updated_by, :created_at, :updated_at
json.url conversation_invite_url(conversation_invite, format: :json)