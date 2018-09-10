class ApplicationController < ActionController::Base

  
  helper_method :current_user
  helper_method :logged_in?
  helper_method :current_user_path


  def welcome
    render "layouts/welcome"
  end

  def check_current_user
    if @passenger
      if @passenger.id == session[:passenger_id]
        true
      else
        false
      end
    else
      if params[:passenger_id].to_i == session[:passenger_id]
        true
      else
        false
      end
    end
  end

  def logged_in?
    if !!session[:passenger_id]
      true
    else
      false
    end
  end

  def current_user
    if logged_in?
      @passenger = Passenger.find(session[:passenger_id])
      "#{@passenger.name}'s Profile"
    else
      false
    end
  end

  def current_user_path
    @passenger = Passenger.find(session[:passenger_id])
    user_path(@passenger)
  end

end
