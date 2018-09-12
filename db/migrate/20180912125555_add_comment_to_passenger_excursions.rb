class AddCommentToPassengerExcursions < ActiveRecord::Migration[5.2]
  def change
    add_column :passenger_excursions, :comment, :string, :default => nil 
  end
end
