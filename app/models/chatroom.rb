class Chatroom < ApplicationRecord
  belongs_to :user
  belongs_to :provider
  has_many :messages, dependent: :destroy
end
