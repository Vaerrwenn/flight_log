class CreateFlights < ActiveRecord::Migration[6.0]
  def change
    create_table :flights do |t|
      t.references :pilot, null: false, foreign_key: true
      t.references :airline, null: false, foreign_key: true
      t.references :aircraft, null: false, foreign_key: true
      t.string :flight_num, limit: 12
      t.datetime :start_time
      t.datetime :end_time
      t.string :origin
      t.string :destination

      t.timestamps
    end
  end
end
