airport_file = File.read("./storage/airports.json")
airports = JSON.parse(airport_file)
count = 0
airports.each do |airport|
  if airport["type"]["airport"] && airport["iso"]["US"] && (airport["size"]["large"] || airport["size"]["medium"])
    count += 1
    puts "#{airport["name"]} #{count}"
    Airport.create!(
                    name: airport["name"],
                    latitude: airport["lat"],
                    longitude: airport["lon"],
                    iata: airport["iata"],
                    size: airport["size"]
                    )
  end
end