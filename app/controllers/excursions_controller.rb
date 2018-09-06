class ExcursionsController < ApplicationController

  def new
    if check_current_user == true
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
    if !@passenger.excursions.include?(@excursion)
      @passenger.excursions << @excursion
      @passenger.save
      redirect_to passenger_path(@passenger)
    else
      flash[:alert] = "You are already signed up for that excersion!"
      redirect_to passenger_path(@passenger)
    end
  end

  def show
    @excursion = Excursion.find(params[:id])
    @passenger = Passenger.find(session[:passenger_id])
  end

  def edit
    if check_current_user == true
      @excursion = Excursion.find(params[:id])
      @passenger = Passenger.find(session[:passenger_id])
      @passenger.excursions.delete(@excursion)
      redirect_to passenger_path(@passenger)
    else
      redirect_to root_path
    end
  end


end
