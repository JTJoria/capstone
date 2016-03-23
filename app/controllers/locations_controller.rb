class LocationsController < ApplicationController

  def index
    @locations = Location.all

      if params[:from] != nil && params[:to] != nil
      p params[:from]

      @start = Date.strptime(params[:from], "%m/%d/%Y")
      @end =  Date.strptime(params[:to], "%m/%d/%Y")
      @length = (@end - @start).to_i + 1
    end    

  end

  def show
    @location = Location.find_by(id: params[:id])
  end

  def create
    @start = Date.strptime(params[:from], "%m/%d/%Y")
    @end =  Date.strptime(params[:to], "%m/%d/%Y")
    @location = Trip.new({creator_id: current_creator.id, city: params[:city], state: params[:state], start_date: @start, end_date: @end})

    @location.save

    @person = Person.new({trip_id: @location.id, name: current_creator.name, gender: current_creator.gender, age: current_creator.age, creator_id: current_creator.id, email: current_creator.email})
      
    @person.save



    redirect_to controller: 'trips', action: 'show', id: @location.id

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
