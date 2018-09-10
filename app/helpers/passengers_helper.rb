module PassengersHelper

  def ship_captain(passenger)
    @captain = Captain.find_by(id: passenger.ship.captain_id)
    @captain.name
  end

  def pluralize_hours(passenger)
    pluralize(passenger.total_excursion_time, "hour")
  end
end
