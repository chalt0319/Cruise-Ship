module PassengersHelper

  def ship_captain(passenger)
    @captain = Captain.find_by(id: passenger.ship.captain_id)
    @captain.name
  end
end
