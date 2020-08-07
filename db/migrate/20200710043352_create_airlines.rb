class CreateAirlines < ActiveRecord::Migration[6.0]
  def change
    create_table :airlines do |t|
      t.string :name
      t.string :icao_code, limit: 4

      t.timestamps
    end
  end
end
