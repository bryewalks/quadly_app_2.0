class Api::DronesController < ApplicationController
  before_action :authenticate_user

  def index
    @drones = Drone.where(user_id: current_user.id)
    render 'index.json.jbuilder'
  end
  
  def create
    @drone = Drone.new(drone_params)
    if @drone.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @drone.errors.full_messages},status: :unprocessable_entity
    end
  end

  def show
    @drone = Drone.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @drone = Drone.find(params[:id])
    @drone.update(drone_params)
    render 'show.json.jbuilder'
  end

  def destroy
    drone = Drone.find(params[:id])
    drone.destroy
    render json: {message: "Successfully Removed Drone"}
  end

  private

  def drone_params
    params
      .require(:drone)
      .permit(:name, :notes, :favorite, :status)
      .merge(user_id: current_user.id)
  end
end