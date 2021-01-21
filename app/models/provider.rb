class Provider < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  has_many :bookings
  has_many :reviews
  has_many :chatrooms
  validates :name, :service_type, :rate, :location, :description, :languages_spoken, presence: true

  def rating
    return 0 if self.reviews.empty?

    total = self.reviews.sum(:rating)
    total / self.reviews.count
  end
end
