class Booking < ApplicationRecord
  belongs_to :customer, :class_name => "User"
  belongs_to :plane

  validate :end_date_after_start_date?

  def end_date_after_start_date?
    if end_date < start_date
      errors.add :end_date, "must be after start date"
    end
  end
end
