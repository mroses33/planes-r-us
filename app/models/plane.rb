class Plane < ApplicationRecord
  belongs_to :owner, :class_name => "User"

  has_many :bookings
  validates :name, length: {minimum: 2}, presence: true
  validates :description, length: {minimum: 10}, presence: true
  validates :price, presence: true
end

