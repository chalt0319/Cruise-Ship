class CreatePassengerExcursions < ActiveRecord::Migration[5.2]
  def change
    create_table :passenger_excursions do |t|
      t.integer :passenger_id
      t.integer :excursion_id

      t.timestamps
    end
  end
end
