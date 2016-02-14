class LocationsController < ApplicationController

  def index
    @locations = Location.all
  end

  def show
    @location = Location.find_by(id: params[:id])
  end

  def create
    @location = Location.new({destionation: params[:destionation], zipcode: params[:zipcode], start_day: params[:start_day], end_day: params[:end_day]})

    @location.save

    flash[:success]= "Location Added"

    redirect_to "/locations"
  end

  def new

  end

  def edit

  end

  def update

  end

  def destroy

  end

end
