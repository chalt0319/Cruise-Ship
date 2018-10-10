class Excursion < ApplicationRecord
  belongs_to :port
  has_many :passenger_excursions
  has_many :passengers, through: :passenger_excursions

  def excursion_pluralize(excursion)
    pluralize(excursion.duration, "hour")
  end
  
end
