class Excursion < ApplicationRecord
  belongs_to :port
  has_many :passenger_excursions
  has_many :passengers, through: :passenger_excursions

end
