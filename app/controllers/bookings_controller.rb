class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def show
    @plane = Plane.find(params[:id])
    @booking = Booking.new
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
    if @booking.save
      render :show
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :customer_id, :plane_id)
  end

end
