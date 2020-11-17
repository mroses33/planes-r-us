require 'JSON'
require 'open-uri'

class PlanesController < ApplicationController
  def index
    @planes = Plane.all
  end

  def show
    @plane = Plane.find(params[:id])
    address_info
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
    params.require(:plane).permit(:name, :description, :price, :postcode, :address_number)
  end

  def address_info
    url = "https://api.getAddress.io/find/#{strong_params[:postcode]}/#{strong_params[:address_number]}?api-key=#{ENV['api_key']}"
    text = JSON.parse(open(url).read)
    @latitude = text["latitude"]
    @longitude = text["longitude"]
  end
end
