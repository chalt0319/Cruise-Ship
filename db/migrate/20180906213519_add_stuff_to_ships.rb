class AddStuffToShips < ActiveRecord::Migration[5.2]
  def change
    add_column :ships, :capacity, :integer
    add_column :ships, :number_of_swimming_pools, :integer
    add_column :ships, :zip_line, :boolean
    add_column :ships, :kid_friendly, :boolean
    add_column :ships, :casino, :boolean
  end
end
