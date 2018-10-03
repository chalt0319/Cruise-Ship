class ExcursionsController < ApplicationController

  def new
    if check_current_user == true
      @excursion = Excursion.new
      find_passenger
      @excursions = Excursion.all
      render :layout => false
    else
      redirect_to root_path
    end
  end

  def create
    find_excursion
    find_passenger
    if !@passenger.excursions.include?(@excursion)
      @passenger.excursions << @excursion
      @passenger.save
      show_passenger_page
    else
      flash[:alert] = "You are already signed up for that excersion!"
      show_passenger_page
    end
  end

  def show
    find_excursion
    find_passenger
  end

  def edit
    if check_current_user == true
      find_excursion
      find_passenger
      @passenger.excursions.delete(@excursion)
      @hours = pluralize_hours(@passenger)
      # binding.pry
      # show_passenger_page
      render json: @hours
    else
      redirect_to root_path
    end
  end

  private

  def find_passenger
    @passenger = Passenger.find(session[:user_id])
  end

  def find_excursion
    if params[:excursion]
      @excursion = Excursion.find(params[:excursion][:id])
    else
      @excursion = Excursion.find(params[:id])
    end
  end

  def show_passenger_page
    redirect_to passenger_path(@passenger)
  end

  def pluralize_hours(passenger)
    time = passenger.total_excursion_time
    hours = pluralize(passenger.total_excursion_time, "hour")
    object = {time: time, hours: hours}
    object
  end

  def pluralize(number, word)
    if number == 0 || number > 1
      word + "s"
    else
      word
    end
  end

end
