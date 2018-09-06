class PassengerExcursion < ApplicationRecord
  belongs_to :passenger
  belongs_to :excursion 
end
