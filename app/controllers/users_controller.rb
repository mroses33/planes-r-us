class UsersController < ApplicationController
  def show
    @user = current_user
    @planes = Plane.where(owner_id: current_user.id)
    @bookings = Booking.where(customer_id: current_user.id)
  end
end
