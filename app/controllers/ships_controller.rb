class ShipsController < ApplicationController

  def index
    @ships = Ship.all
  end

  def show
    @ship = Ship.largest_ship
  end


end
