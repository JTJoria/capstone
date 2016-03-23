class SituationsController < ApplicationController

  def index

    persons = Person.all
    

    @tripmates = []
    @this_trip_id = params[:trip_id].to_i

    @tripstuff = TripSituation.where(trip_id: @this_trip_id)

    
    persons.each do |person|
      if @this_trip_id == person.trip_id
        @tripmates << person
      end
    end
  end


  def create
    situations = Situations.all

    @events = []
    @this_trip_id = current_creator.trips.last.id

  end

  def remove_situation
    params[:situation_id]
    situations = TripSituation.where(:situation_id => params[:situation_id], :people_id => params[:people_id], :trip_id => params[:trip_id])
    situations.each do |situation|
      situation.destroy
    end
  end

  def add_situation

    situation = TripSituation.new({situation_id: params[:situation_id], trip_id: params[:trip_id], people_id: params[:people_id].to_i})

    situation.save

  end
end
