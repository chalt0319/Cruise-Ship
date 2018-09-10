class Ship < ApplicationRecord
  has_many :passengers

  def self.largest_ship
    Ship.order("capacity DESC").limit(1)[0]
  end

end
