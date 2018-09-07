class AddUidToPassengers < ActiveRecord::Migration[5.2]
  def change
    add_column :passengers, :uid, :integer
  end
end
