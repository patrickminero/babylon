class Message < ApplicationRecord
  belongs_to :user
  belongs_to :provider
  belongs_to :chatroom
end
