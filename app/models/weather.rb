class Weather
  attr_accessor :wind_speed, :temperature, :visibility_miles, :max_gust_speed, :chance_of_precipitation, :cloud_cover, :good_to_fly
  
  def initialize(input_options)
    @wind_speed              = input_options[:wind_speed]
    @temperature             = input_options[:temperature]
    @visibility_miles        = input_options[:visibility_miles]
    @max_gust_speed          = input_options[:max_gust_speed]
    @chance_of_precipitation = input_options[:chance_of_precipitation]
    @cloud_cover             = input_options[:cloud_cover]
    set_good_to_fly
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
