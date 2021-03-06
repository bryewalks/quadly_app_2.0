class Location < ApplicationRecord
  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude
  after_validation :geocode, if: :address_changed?
  after_validation :reverse_geocode
  enum flight_zone_status: {no_flight_zone: 0, flight_zone: 1, requires_authorization: 2}

  def initialize(input_options)
    super
    determine_status
  end

  def determine_status
    nearby_airports = Airport.near([self.latitude, self.longitude], 5)

    if nearby_airports.where(size: 'large').any?
      self.flight_zone_status = 'no_flight_zone'
    elsif nearby_airports.where.not(size: 'large').any?
      self.flight_zone_status = 'requires_authorization'
    else
      self.flight_zone_status = 'flight_zone'
    end
  end
end
