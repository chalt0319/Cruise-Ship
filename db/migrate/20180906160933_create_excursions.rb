class CreateExcursions < ActiveRecord::Migration[5.2]
  def change
    create_table :excursions do |t|
      t.string :title
      t.integer :duration
      t.integer :port_id

      t.timestamps
    end
  end
end
