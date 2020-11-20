class Booking < ApplicationRecord
  belongs_to :customer, :class_name => "User"
  belongs_to :plane

  validate :no_reservation_overlap
  validate :end_date_after_start_date?

  def end_date_after_start_date?
    if end_date < start_date
      errors.add :start_date, "must be before end date"
    end
  end


  def no_reservation_overlap
    if (Booking.where("(? BETWEEN start_date AND end_date OR ? BETWEEN start_date AND end_date) AND plane_id = ?", self.start_date, self.end_date, self.plane_id).any?)
      errors.add :end_date, 'is unavailable for these dates'
    end
  end
end
