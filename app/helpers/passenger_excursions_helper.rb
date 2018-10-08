module PassengerExcursionsHelper

  def find_pe(passenger, excursion)
    PassengerExcursion.where("passenger_id = ? AND excursion_id = ?", passenger.id, excursion.id)
  end

end
