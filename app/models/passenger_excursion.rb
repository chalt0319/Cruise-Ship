class PassengerExcursion < ApplicationRecord
  belongs_to :passenger
  belongs_to :excursion

  def self.most_recent
    self.order("id DESC").limit(1)
  end

  def self.find_pe(passenger, excursion)
    where("passenger_id = ? AND excursion_id = ?", passenger.id, excursion.id)
  end
end
