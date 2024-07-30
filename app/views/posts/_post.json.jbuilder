json.extract! post, :id, :user_id, :picture, :description, :created_at, :updated_at
json.url post_url(post, format: :json)
