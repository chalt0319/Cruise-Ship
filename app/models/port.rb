class Port < ApplicationRecord
  has_many :port_ships
  has_many :ships, through: :port_ships
  has_many :excursions
end
