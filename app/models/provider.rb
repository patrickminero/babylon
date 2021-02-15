class Provider < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_name_and_service_type,
    against: [ :name, :service_type ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  serialize :languages
  belongs_to :user
  has_many_attached :photos
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :chatrooms, dependent: :destroy
  validates :name, :service_type, :rate, :location, :description, :languages, presence: true
  validates :name, uniqueness: true

  def rating
    return 0 if self.reviews.empty?

    total = self.reviews.sum(:rating)
    total / self.reviews.count
  end
end
