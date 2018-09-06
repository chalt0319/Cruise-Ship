class Ship < ApplicationRecord
  has_many :passengers
  has_many :port_ships
  has_many :ports, through: :port_ships

end
