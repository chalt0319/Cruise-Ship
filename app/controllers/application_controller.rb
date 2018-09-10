class ApplicationController < ActionController::Base


  helper_method :current_user
  helper_method :logged_in?
  helper_method :current_user_path
  helper_method :current_user_instance


  def welcome
    render "layouts/welcome"
  end

  def check_current_user
    if @passenger || @captain
      if @passenger.id == session[:user_id] || @captain.id == session[:user_id]
        true
      else
        false
      end
    else
      if params[:passenger_id].to_i == session[:user_id]
        true
      else
        false
      end
    end
  end

  def logged_in?
    if !!session[:user_id] || !!session[:captain_id]
      true
    else
      false
    end
  end

  def current_user
    if logged_in?
      if @captain = Captain.find_by(id: session[:captain_id])
        "#{@captain.name}'s Profile"
      elsif @passenger = Passenger.find_by(id: session[:user_id])
        "#{@passenger.name}'s Profile"
      else
        false
      end
    else
      false
    end
  end

  def current_user_path
    if !!Passenger.find_by(id: session[:user_id])
      @passenger = Passenger.find(session[:user_id])
      passenger_path(@passenger)
    elsif !!Captain.find_by(id: session[:captain_id])
      @captain = Captain.find(session[:captain_id])
      captain_path(@captain)
    end
  end

  def current_user_instance
    if !!Passenger.find_by(id: session[:user_id])
      Passenger.find(session[:user_id])
    elsif !!Captain.find_by(id: session[:captain_id])
      Captain.find(session[:captain_id])
    end
  end

end
