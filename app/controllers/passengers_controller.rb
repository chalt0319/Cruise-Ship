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
        flash[:alert1] = "#{error_messages[0]}"
        flash[:alert2] = "#{error_messages[1]}"
        flash[:alert3] = "#{error_messages[2]}"
        render "new"
      end
    elsif auth
      if @passenger = Passenger.find_by(uid: auth[:uid])
        session[:passenger_id] = @passenger.id
        redirect_to passenger_path(@passenger)
      else
        @passenger = Passenger.new
        @passenger.uid = auth[:uid]
        @passenger.name = auth[:info][:name]
        @passenger.password = SecureRandom.hex
        @passenger.ship_id = session[:ship_id].to_i
        @passenger.save
        session[:passenger_id] = @passenger.id
        redirect_to passenger_path(@passenger)
      end
    else
      if @passenger = Passenger.find_by(name: params[:name])
        if @passenger.authenticate(params[:password])
          session[:passenger_id] = @passenger.id
          redirect_to passenger_path(@passenger)
        else
          flash[:alert] = "We cannot find your account in our system... Please try again."
          redirect_to login_path
        end
      else
        flash[:alert] = "We cannot find your account in our system... Please try again."
        redirect_to login_path
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

  def fb_login
  end

  def fb_create
    session[:ship_id] = params[:passenger][:ship_id]
    redirect_to '/auth/facebook'
  end

  def logout
    session[:passenger_id] = nil
    redirect_to root_path
  end

  private

  def passenger_params
    params.require(:passenger).permit(:name, :password, :ship_id)
  end

  def error_messages
    @alert = []
    @passenger.errors.full_messages.each do |m|
      @alert << m
    end
    @alert
  end

  def auth
    request.env['omniauth.auth']
  end

end
