class CaptainsController < ApplicationController

  def new
    @captain = Captain.new
  end

  def create
    if params[:captain]
      @captain = Captain.new(captain_params)
      if @captain.save
        set_session_id
      else
        redirect_to new_captain_path
      end
    else
      if @captain = Captain.find_by(name: params[:name])
        if @captain.authenticate(params[:password])
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
    @captain = Captain.find(session[:captain_id])
  end

  def login
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def captain_params
    params.require(:captain).permit(:name, :password, :secret_phrase)
  end

  def set_session_id
    session[:captain_id] = @captain.id
    redirect_to captain_path(@captain)
  end

  def cannot_find_account
    flash[:alert] = "We cannot find your account in our system... Please try again."
    redirect_to captain_login_path
  end

end
