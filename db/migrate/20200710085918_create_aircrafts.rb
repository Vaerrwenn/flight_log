class CreateAircrafts < ActiveRecord::Migration[6.0]
  def change
    create_table :aircrafts do |t|
      t.string :registration, limit: 8
      t.string :model, limit: 30
      t.references :manufacturer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
