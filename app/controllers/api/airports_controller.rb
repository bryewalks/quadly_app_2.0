class Api::AirportsController < ApplicationController

  def index
    @airports = Airport.all
    render 'index.json.jbuilder'
  end

  def show
    @airport = Airport.find(params[:id])
    render 'show.json.jbuilder'
  end

end
