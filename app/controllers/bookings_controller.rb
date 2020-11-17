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
    @booking = Booking.new(booking_params)
    @customer = User.find(params[:customer_id])
    @booking.plane = @plane
    @booking.customer = @customer
    if @booking.save
      redirect_to plane_path(@plane)
    else
      render "booking/new"
    end
  end

  private

  params.require(:booking).permit(:start_date, :end_date, :price, :customer_id, :plane_id)

end
