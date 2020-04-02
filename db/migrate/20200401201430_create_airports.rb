class CreateAirports < ActiveRecord::Migration[6.0]
  def change
    create_table :airports do |t|
      t.string "name"
      t.string "city"
      t.string "state"
      t.string "country"
      t.string "size"
      t.string "icao"
      t.string "iata"
      t.decimal "latitude", precision: 10, scale: 6
      t.decimal "longitude", precision: 10, scale: 6
      t.timestamps
    end
  end
end