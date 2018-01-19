class RidesController < ApplicationController
  def create
    @ride = Ride.new(ride_params)
    if @ride.save
      flash[:notice] = @ride.take_ride
      redirect_to user_path(@ride.user)
    else
      flash[:notice] = @ride.errors
      redirect_to attraction_path(@ride.attraction)
    end
  end

  private

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end

end
