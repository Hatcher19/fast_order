json.extract! message, :id, :body, :order_id, :user_id, :created_at, :updated_at
json.url message_url(message, format: :json)
