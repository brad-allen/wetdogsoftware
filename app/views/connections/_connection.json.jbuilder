json.extract! connection, :id, :profile_id, :connection_profile_id, :status, :created_by, :updated_by, :created_at, :updated_at
json.url connection_url(connection, format: :json)