class Booking < ApplicationRecord
  belongs_to :customer, :class_name => "User"
  belongs_to :plane

  validate :overlapping
    private
    def overlapping
    if Booking.where('? <  end_date and ? > start_date', self.start_date, self.end_date).any?
        errors.add(:end_date, 'it overlaps another')
  end
end
