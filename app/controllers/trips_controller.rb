class TripsController < ApplicationController

  def index
    @trips = Trip.all
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



  
end