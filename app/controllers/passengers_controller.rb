class PassengersController < ApplicationController

  def new
    @passenger = Passenger.new
  end

  def create
    if params[:passenger]
      @passenger = Passenger.new(passenger_params)
      if @passenger.save
        set_session_id
      else
        set_flash_alerts
        render "new"
      end
    elsif auth
      if @passenger = Passenger.find_by(uid: auth[:uid])
        set_session_id
      else
        fb_setup
        set_session_id
      end
    else
      if @passenger = Passenger.find_by(name: params[:name])
        if @passenger.authenticate(params[:password])
          set_session_id
        else
          cannot_find_account
        end
      else
        cannot_find_account
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
    session[:user_id] = nil
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

  def set_session_id
    session[:user_id] = @passenger.id
    redirect_to passenger_path(@passenger)
  end

  def fb_setup
    @passenger = Passenger.new
    @passenger.uid = auth[:uid]
    @passenger.name = auth[:info][:name]
    @passenger.password = SecureRandom.hex
    @passenger.ship_id = session[:ship_id].to_i
    @passenger.save
  end

  def set_flash_alerts
    flash[:alert1] = "#{error_messages[0]}"
    flash[:alert2] = "#{error_messages[1]}"
    flash[:alert3] = "#{error_messages[2]}"
  end

  def cannot_find_account
    flash[:alert] = "We cannot find your account in our system... Please try again."
    redirect_to login_path
  end

end
