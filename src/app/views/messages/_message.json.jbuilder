json.extract! message, :id, :message, :product_id, :date, :sender_id, :receiver_id, :created_at, :updated_at
json.url message_url(message, format: :json)
