class Provider < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  has_many :bookings
  validates :name, :service_type, :rate, :location, :description, :languages_spoken, presence: true
end
