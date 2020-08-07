class CreatePilots < ActiveRecord::Migration[6.0]
  def change
    create_table :pilots do |t|
      t.string :name
      t.date :date_of_birth
      t.string :gender

      t.timestamps
    end
  end
end
