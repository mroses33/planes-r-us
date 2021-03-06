class BookingsController < ApplicationController

  def index
    @bookings = current_user.bookings
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @plane = Plane.find(params[:plane_id])
    @booking = Booking.new
  end

  def create
    @plane = Plane.find(params[:plane_id])
    @customer = current_user
    @booking = Booking.new(booking_params)
    @booking.plane = @plane
    @booking.customer = @customer

    @days = (@booking.end_date - @booking.start_date).to_i
    @price = @days * @booking.plane.price
    @booking.plane.price = @price > 0 ? @price : @booking.plane.price
    if @booking.save
      render :show
    else
      render "planes/show"
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :customer_id, :plane_id)
  end

end
