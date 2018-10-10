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
    # binding.pry
    if !@passenger.excursions.include?(@excursion)
      # binding.pry
      @passenger.excursions << @excursion
      @passenger.save
      @port = Port.find(@excursion.port_id)
      @hours = pluralize(@excursion.duration, "hour")
      @total_hours = pluralize_hours(@passenger)
      @pe = find_pe(@passenger, @excursion)[0]
      @data = {passenger: @passenger, excursion: @excursion, port: @port, hours: @hours, pe: @pe, total_hours: @total_hours}
      render json: @data
      # show_passenger_page
    else
      flash[:alert] = "You are already signed up for that excersion!"
      show_passenger_page
    end
  end

  def show
    find_excursion
    find_passenger
    render :layout => false
  end

  def edit
    if check_current_user == true
      find_excursion
      find_passenger
      @passenger.excursions.delete(@excursion)
      @hours = pluralize_hours(@passenger)
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

  def find_pe(passenger, excursion)
    PassengerExcursion.where("passenger_id = ? AND excursion_id = ?", passenger.id, excursion.id)
  end

end
