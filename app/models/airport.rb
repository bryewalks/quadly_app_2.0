class Airport < ApplicationRecord
  # reverse_geocoded_by :latitude, :longitude do |airport,results|
  #   if geo = results.first
  #     airport.city    = geo.city
  #     airport.country = geo.country
  #     airport.state   = geo.state
  #   end
  # end
  # after_validation :reverse_geocode
end
