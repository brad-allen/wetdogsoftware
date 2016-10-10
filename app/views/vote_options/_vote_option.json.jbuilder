json.extract! vote_option, :id, :name, :description, :value, :image, :widget_style_id, :created_by, :updated_by, :created_at, :updated_at
json.url vote_option_url(vote_option, format: :json)