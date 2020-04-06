class Weather
  attr_accessor :wind_speed, :temperature, :visibility_miles, :max_gust_speed, :chance_of_precipitation, :cloud_cover, :good_to_fly
  
  def initialize(latitude, longitude)
    response = HTTP.get("https://api.darksky.net/forecast/#{ ENV['DS_API_KEY'] }/#{ latitude },#{ longitude }")
    if response.code === 200
      response = response.parse['currently']
      @wind_speed              = response['windSpeed']
      @temperature             = response['temperature']
      @visibility_miles        = response['visibility']
      @max_gust_speed          = response['windGust']
      @chance_of_precipitation = response['precipProbability']
      @cloud_cover             = response['cloudCover']
      set_good_to_fly
    end
  end

  def check_wind
    @wind_speed <= 20
  end

  def check_temperature
    @temperature.between?(32,98)
  end

  def check_visibility
    @visibility_miles >= 3
  end

  def check_gust
    @max_gust_speed <= 20
  end

  def check_precipitation
    @chance_of_precipitation <= 40
  end

  def check_clouds
    @cloud_cover <= 75
  end

  def check_conditions
    check_wind && 
    check_temperature && 
    check_visibility && 
    check_gust && 
    check_precipitation && 
    check_clouds
  end

  def set_good_to_fly
    @good_to_fly = check_conditions  
  end
end
