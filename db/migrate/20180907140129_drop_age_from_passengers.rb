class DropAgeFromPassengers < ActiveRecord::Migration[5.2]
  def change
    remove_column :passengers, :age
  end
end
