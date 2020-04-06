class Api::WeathersController < ApplicationController

  def current_weather
    if params[:latitude] && params[:longitude]
      @weather = Weather.new(params[:latitude], params[:longitude])
      render 'show.json.jbuilder'
    else
      render json: {errors: 'Missing latitude or longitude.'},status: :unprocessable_entity
    end
  end
end
