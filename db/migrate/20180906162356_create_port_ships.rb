class CreatePortShips < ActiveRecord::Migration[5.2]
  def change
    create_table :port_ships do |t|
      t.integer :port_id
      t.integer :ship_id

      t.timestamps
    end
  end
end
