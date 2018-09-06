class ApplicationController < ActionController::Base

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

  def welcome
    render "layouts/welcome"
  end
end
