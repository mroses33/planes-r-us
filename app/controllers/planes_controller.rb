class PlanesController < ApplicationController
  def index
    @planes = Plane.all
  end

  def show
    @plane = Plane.find(params[:id])
  end

  def new
    @owner = current_user.id
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
    params.require(:plane).permit(:name, :description, :price)
  end
end
