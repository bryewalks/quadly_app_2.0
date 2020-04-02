#disable geocoding for small airports as city, state, and country already present in JSON file
airport_file = File.read("./storage/small_airports.json")
airports = JSON.parse(airport_file)
count = 0
airports.each do |k, airport|
  if airport["country"]["US"] && (airport["iata"] === "")
    count += 1
    puts "#{ airport["name"] } #{ count }"
    Airport.create!(
                    name: airport["name"],
                    city: airport["city"],
                    state: airport["state"],
                    country: "United States of America",
                    latitude: airport["lat"],
                    longitude: airport["lon"],
                    size: "small",
                    icao: airport["icao"]
                    )
  end
end