json.extract! group_action, :id, :group_id, :profile_id, :action, :description, :visibility_id, :status, :created_by, :updated_by, :created_at, :updated_at
json.url group_action_url(group_action, format: :json)