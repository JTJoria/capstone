class SituationsController < ApplicationController

  def index

    persons = Person.all

    @tripmates = []
    this_trip_id = current_creator.trips.last.id

    
    persons.each do |person|
      if this_trip_id == person.trip_id
        @tripmates << person
      end
    end
  end


  def create
    situations = Situations.all

    @events = []
    this_trip_id = current_creator.trips.last.id

    # situations.each do |situation|
    #   if situation 
    # end

  end
end
