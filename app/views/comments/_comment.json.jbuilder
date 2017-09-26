json.extract! comment, :id, :photo_id, :user_id, :content, :created_at, :updated_at
json.url comment_url(comment, format: :json)
