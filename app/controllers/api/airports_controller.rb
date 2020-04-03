class Api::AirportsController < ApplicationController

  def index
    @airports = Airport.all
    render 'index.json.jbuilder'
  end

  def show
    @airport = Airport.find(params[:id])
    render 'show.json.jbuilder'
  end
  #TODO: refactor search
  def search
    search_name      = params[:name]
    search_address   = params[:address]
    search_city      = params[:city]
    search_state     = params[:state]
    search_latitude  = params[:latitude]
    search_longitude = params[:longitude]
    search_distance  = params[:distance] || 25

    if search_latitude && search_longitude
      @airports = Airport.near([search_latitude, search_longitude], search_distance)
    elsif search_address
      @airports = Airport.near(search_address, search_distance)
    elsif search_name
      @airports = Airport.where('lower(name) LIKE ?', search_name.downcase)
    elsif search_city
      @airports = Airport.where('lower(city) LIKE ?', search_city.downcase)
    elsif search_state
      @airports = Airport.where('lower(state) LIKE ?', search_state.downcase)
    end

    render 'index.json.jbuilder'
  end

end
