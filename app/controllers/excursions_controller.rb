class ExcursionsController < ApplicationController

  def new
    if params[:passenger_id]
      @excursion = Excursion.new
    else
      redirect_to root_path
    end
  end

  def create
    @excursion = Excursion.find(params[:excursion_id])
    @passenger = Passenger.find(session[:passenger_id])
    @passenger.excursions << @excursion
    @passenger.save
    redirect_to passenger_path(@passenger)
  end

  def show

  end


end
