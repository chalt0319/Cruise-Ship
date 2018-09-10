class AddCaptainIdToShips < ActiveRecord::Migration[5.2]
  def change
    add_column :ships, :captain_id, :integer 
  end
end
