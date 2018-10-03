class PassengerExcursionsController < ApplicationController


  def edit
    @excursion = Excursion.find_by(id: params[:excursion_id])
    @passenger = Passenger.find_by(id: params[:passenger_id])
    @passenger_excursion = PassengerExcursion.find_passenger_excursion(@passenger, @excursion)[0]
    render :layout => false
  end

  def update
    @passenger = Passenger.find_by(id: params[:passenger_id])
    @passenger_excursion = PassengerExcursion.find_by(id: params[:id])
    @passenger_excursion.update(the_params)
    redirect_to passenger_path(@passenger)
    # render :layout => false
  end

  def show
    test = PassengerExcursion.most_recent[0]
    @passenger = Passenger.find_by(id: test.passenger_id)
    @excursion = Excursion.find_by(id: test.excursion_id)

  end

  private

  def the_params
    params.require(:passenger_excursion).permit(:comment)
  end
end
