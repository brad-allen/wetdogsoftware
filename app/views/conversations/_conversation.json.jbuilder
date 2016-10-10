json.extract! conversation, :id, :title, :allow_html, :status, :created_by, :updated_by, :created_at, :updated_at
json.url conversation_url(conversation, format: :json)