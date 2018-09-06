class Passenger < ApplicationRecord
  belongs_to :ship
  has_many :passenger_excursions
  has_many :excursions, through: :passenger_excursions
  has_many :ports, through: :excursions
end
