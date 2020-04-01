# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
airport_file = File.read("./storage/airports.json")
airports = JSON.parse(airport_file)

airports.each do |airport|
  if airport["type"]["airport"] && airport["iso"]["US"] && (airport["size"]["large"] || airport["size"]["medium"])
    Airport.create!(
                      name: airport["name"],
                      latitude: airport["lat"],
                      longitude: airport["lon"],
                      size: airport["size"]
                      )
  end
end
