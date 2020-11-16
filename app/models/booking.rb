class Booking < ApplicationRecord
  belongs_to :customer, :class_name => "User"
  belongs_to :plane



end
