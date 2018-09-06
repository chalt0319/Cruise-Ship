class Passenger < ApplicationRecord

  validates :name, presence: true
  validates :age, presence: true
  
  belongs_to :ship
  has_many :passenger_excursions
  has_many :excursions, through: :passenger_excursions
  has_many :ports, through: :excursions



end
