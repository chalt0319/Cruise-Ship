class ExcursionsController < ApplicationController

  def new
    if params[:passenger_id]
      @excursion = Excursion.new
      @passenger = Passenger.find(params[:passenger_id])
      @excursions = Excursion.all
    else
      redirect_to root_path
    end
  end

  def create
    @excursion = Excursion.find(params[:excursion][:id])
    @passenger = Passenger.find(session[:passenger_id])
    @passenger.excursions << @excursion
    @passenger.save
    redirect_to passenger_path(@passenger)
  end

  def show
    @excursion = Excursion.find(params[:id])
    @passenger = Passenger.find(params[:passenger_id])
  end


end
