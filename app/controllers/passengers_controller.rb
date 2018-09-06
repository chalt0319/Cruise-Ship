class PassengersController < ApplicationController

  # before_action :check_current_user, only: [:show]

  def new
    @passenger = Passenger.new
  end

  def create
    if params[:passenger]
      @passenger = Passenger.new(passenger_params)
      if @passenger.save
        session[:passenger_id] = @passenger.id
        redirect_to passenger_path(@passenger)
      else
        flash[:alert] = "#{error_messages[0]} - #{error_messages[1]} - #{error_messages[2]}"
        redirect_to new_passenger_path
      end
    else
      if @passenger = Passenger.find_by(name: params[:name])
        if @passenger.authenticate(params[:password])
          session[:passenger_id] = @passenger.id
          redirect_to passenger_path(@passenger)
        else
          flash[:alert] = "We cannot find your account in our system... Please try again."
          redirect_to new_passenger_path
        end
      else
        flash[:alert] = "We cannot find your account in our system... Please try again."
        redirect_to new_passenger_path
      end
    end
  end

  def show
    @passenger = Passenger.find(params[:id])
    @excursions = @passenger.excursions
    if !!check_current_user
    else
      redirect_to root_path
    end
  end

  def login

  end

  def logout
    session[:passenger_id] = nil
    redirect_to root_path
  end

  private

  def passenger_params
    params.require(:passenger).permit(:name, :password, :age, :ship_id)
  end

  def error_messages
    @alert = []
    @passenger.errors.full_messages.each do |m|
      @alert << m
    end
    @alert
  end
end
