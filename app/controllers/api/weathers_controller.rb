class Api::WeathersController < ApplicationController

  def current_weather
    response = HTTP.get("https://api.darksky.net/forecast/#{ ENV['DS_API_KEY'] }/#{ params[:latitude] },#{ params[:longitude] }")
    results = response.parse
    if response.code === 200
      @weather = Weather.new(
                              wind_speed: results['currently']['windSpeed'],
                              temperature: results['currently']['temperature'],
                              visibility_miles: results['currently']['visibility'],
                              max_gust_speed: results['currently']['windGust'],
                              chance_of_precipitation: results['currently']['precipProbability'],
                              cloud_cover: results['currently']['cloudCover']
                            )
      render 'show.json.jbuilder'
    else
      render json: {error: results['error']}
    end
  end
end
