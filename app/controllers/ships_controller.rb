class ShipsController < ApplicationController

  def new
    @ship = Ship.new
  end

  def create
    @ship = Ship.new(ship_params)
    @ship.captain_id = current_user_instance.id
    if @ship.save
      redirect_to captain_path(current_user_instance)
    else
      set_flash_alerts
      redirect_to new_ship_path
    end

  end

  def index
    @ships = Ship.all
  end

  def show
    @ship = Ship.largest_ship
  end

  def edit
    @ship = Ship.find(params[:id])
  end

  def update
    @ship = Ship.find_by(id: params[:id].to_i)
    @ship.update(ship_params)
    redirect_to captain_path(current_user_instance)
  end

  def destroy
    @ship = Ship.find(params[:id])
    @ship.delete
    redirect_to captain_path(current_user_instance)
  end 

  private

  def ship_params
    params.require(:ship).permit(:name, :capacity, :number_of_swimming_pools, :kid_friendly, :casino, :zip_line)
  end

  # def update_params
  #   params.require(:ship).permit(:capacity, :number_of_swimming_pools, :kid_friendly, :casino, :zip_line)
  # end

  def error_messages
    @alert = []
    @ship.errors.full_messages.each do |m|
      @alert << m
    end
    @alert
  end

  def set_flash_alerts
    flash[:alert1] = "#{error_messages[0]}"
    flash[:alert2] = "#{error_messages[1]}"
    flash[:alert3] = "#{error_messages[2]}"
  end


end
