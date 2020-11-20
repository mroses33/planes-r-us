class Plane < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :owner, :class_name => "User"
  has_many :bookings
  has_many_attached :photos

  validates :name, length: {minimum: 2}, presence: true
  validates :description, length: {minimum: 10}, presence: true
  validates :price, presence: true

  def unavailable_dates
    bookings.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end
end

