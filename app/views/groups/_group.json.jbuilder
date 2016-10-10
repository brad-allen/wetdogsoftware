json.extract! group, :id, :name, :description, :status, :created_by, :updated_by, :visibility_id, :group_type, :created_at, :updated_at
json.url group_url(group, format: :json)