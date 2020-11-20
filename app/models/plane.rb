class Plane < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :owner, :class_name => "User"
  has_many :bookings, dependent: :destroy
  has_many_attached :photos, dependent: :destroy

  validates :name, length: { minimum: 2 }, presence: true
  validates :description, length: { minimum: 10 }, presence: true
  validates :price, presence: true
end
