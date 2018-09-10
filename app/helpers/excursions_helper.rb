module ExcursionsHelper

  def excursion_pluralize(excursion)
    pluralize(excursion.duration, "hour")
  end
end
