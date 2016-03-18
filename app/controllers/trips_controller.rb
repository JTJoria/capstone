class TripsController < ApplicationController

  before_action :require_login
 
  def require_login
    unless creator_signed_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to "/"
    end
  end

  def index
    trips = Trip.all

    @this_trip = []

    trips.each do |trip|
      if current_creator.id == trip.creator_id
        @this_trip << trip
      end
    end
  end

  def show
    @trip = Trip.find_by(id: params[:id])
  end

  def create
    @trip = Trip.new({creator_id: current_creator.id, city: params[:city], state: params[:state], start_date: params[:from], end_date: params[:to]})

    @trip.save
  end

  def new
    @trip = Trip.new
  end

  def edit
    @trip = Trip.find_by(id: params[:id])
  end

  def update
    @trip = Trip.find_by(id: params[:id])
    if @trip.update_attributes(trip_params)
      redirect_to "/trip/#{@trip.id}"
    else
      render 'edit'
    end
  end

  def destroy
    @trip = Trip.find_by(id: params[:id])
    @trip.destroy

    redirect_to "/trips"
  end



  
end