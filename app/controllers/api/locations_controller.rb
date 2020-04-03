class Api::LocationsController < ApplicationController

  def index
    @locations = Location.all
    render 'index.json.jbuilder'
  end
  
  def create
    @location = Location.new(location_params)
    if @location.save && @location.determine_status
      render 'show.json.jbuilder'
    else
      render json: {errors: @location.errors.full_messages},status: :unprocessable_entity
    end
  end

  def show
    @location = Location.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @location = Location.find(params[:id])
    @location.update(location_params)
    render 'show.json.jbuilder'
  end

  def destroy
    location = Location.find(params[:id])
    location.destroy
    render json: {message: "Successfully Removed Location"}
  end

  private

  def location_params
    params
      .require(:location)
      .permit(:name, :address, :latitude, :longitude)
  end
end
