json.extract! post, :id, :profile_id, :group_id, :page_id, :visibility_id, :post_type, :content, :image, :thumb_image, :status, :created_at, :updated_at
json.url post_url(post, format: :json)