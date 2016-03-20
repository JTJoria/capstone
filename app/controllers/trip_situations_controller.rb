class TripSituationsController < ApplicationController

  def index

  end

  def create

    @this_trip = ThisTrip.new({situation_id: params[:situation_id], trip_id: params[:trip_id]})

    @this_trip.save

  end


end
