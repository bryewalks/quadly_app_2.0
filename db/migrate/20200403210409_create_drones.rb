class CreateDrones < ActiveRecord::Migration[6.0]
  def change
    create_table :drones do |t|
      t.string "name"
      t.text "notes"
      t.boolean "favorite", default: false
      t.integer "status"
      t.integer "user_id"
      t.timestamps
    end
  end
end
