class Message < ApplicationRecord
  belongs_to :product
  belongs_to :sender, foreign_key: "sender_id", class_name: "User"
  belongs_to :receiver,foreign_key: "receiver_id", class_name: "User"
end
