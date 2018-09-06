class PassengersController < ApplicationController

  def new
    @passenger = Passenger.new
  end

  def create
    @passenger = Passenger.new(passenger_params)
    if @passenger.save
      session[:passenger_id] = @passenger.id
      redirect_to passenger_path(@passenger)
    else
      redirect_to new_passenger_path
    end
  end

  def show
    @passenger = Passenger.find(params[:id])
    @excursions = @passenger.excursions
  end

  private

  def passenger_params
    params.require(:passenger).permit(:name, :age, :ship_id)
  end
end
