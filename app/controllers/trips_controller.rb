class TripsController < ApplicationController

  def index
    @trips = Trips.new
  end

  
end
