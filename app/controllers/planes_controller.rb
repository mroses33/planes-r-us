require 'json'
require 'open-uri'

class PlanesController < ApplicationController
  def index
    if params[:search_city].present?
      @planes = Plane.near(params[:search_city])
    else
      @planes = Plane.all
    end

    @markers = @planes.geocoded.map do |plane|
      {
        lat: plane.latitude,
        lng: plane.longitude
      }
    end
  end

  def show
    @plane = Plane.find(params[:id])
  end

  def new
    @owner = current_user
    @plane = Plane.new
  end

  def create
    @plane = Plane.new(strong_params)
    @owner = current_user
    @plane.owner = @owner
    if @plane.save
      redirect_to plane_path(@plane)
    else
      render :new
    end
  end

  private

  def strong_params
    params.require(:plane).permit(:name, :description, :price, :address, photos: [])
  end
end
