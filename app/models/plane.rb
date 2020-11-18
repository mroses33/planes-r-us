class Plane < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :owner, :class_name => "User"
  has_many :bookings
  has_one_attached :photo

  validates :name, length: {minimum: 2}, presence: true
  validates :description, length: {minimum: 10}, presence: true
  validates :price, presence: true
end

