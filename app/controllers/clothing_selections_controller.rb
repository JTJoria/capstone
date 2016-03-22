class ClothingSelectionsController < ApplicationController
  def index
    persons = Person.all

    @tripmates = []
    this_trip = Trip.find_by(id: params[:trip_id])
    this_trip_id = params[:trip_id].to_i

    @tripstuff = TripSituation.where(trip_id: this_trip_id)

    persons.each do |person|
      if this_trip_id == person.trip_id
        @tripmates << person
      end
    end

    if this_trip.start_date != nil && this_trip.end_date != nil
      p this_trip.end_date

      @start = this_trip.start_date.strftime("%m/%d/%Y")
      @end =  this_trip.end_date.strftime("%m/%d/%Y")
      @length = (this_trip.end_date - this_trip.start_date).to_i
    end



    @city = this_trip.city || "Chicago"
    @state = this_trip.state || "IL"

    

    weather = Unirest.get("http://api.wunderground.com/api/41904cbf33b185b4/forecast10day/q/#{@state}/#{@city}.json").body

    @forecasts = weather["forecast"]["simpleforecast"]["forecastday"]

    @days = []
    @forecasts.each do |day|
      dayHash = {}
      dayHash[:month] = day["date"]["monthname"]
      dayHash[:day] = day["date"]["day"]
      dayHash[:year] = day["date"]["year"]
      dayHash[:image] = day["icon_url"]
      dayHash[:high] = day["high"]["fahrenheit"]
      dayHash[:low] = day["low"]["fahrenheit"]
      dayHash[:conditions] = day["conditions"]
      @days << dayHash
    end



    @outfits  = []
    @essentials = []

      @tripmates.each do |p|
        @outfits[p.id] = []
        @essentials[p.id] = []
      end

  @tripmates.each do |person|  

      if CheckSituation(person.id, 2)

        @event = SituationCategory.where(situation_id: 2)
        categories = []
        @event.each do |e|
          categories << e
        end
        @outfits[person.id].concat  FindOutfitsByCategories(categories, person.gender)
      end

      if CheckSituation(person.id, 3)
        @event = SituationCategory.where(situation_id: 3)
        categories = []
        @event.each do |e|
          categories << e
        end
        @outfits[person.id].concat FindOutfitsByCategories(categories, person.gender)
    
      end

      if CheckSituation(person.id, 5)
        @event = SituationCategory.where(situation_id: 5)
        categories = []
        @event.each do |e|
          categories << e
        end
        @outfits[person.id].concat FindOutfitsByCategories(categories, person.gender)

      end

      if CheckSituation(person.id, 4)
        @event = SituationCategory.where(situation_id: 4)
        categories = []
        @event.each do |e|
          categories << e
        end
        @outfits[person.id].concat FindOutfitsByCategories(categories, person.gender)

      end

      if CheckSituation(person.id, 1)
        @event = SituationCategory.where(situation_id: 1)
        categories = []
        @event.each do |e|
          categories << e
        end
        @outfits[person.id].concat FindOutfitsByCategories(categories, person.gender)

      end

      if CheckSituation(person.id, 6)
        @event = SituationCategory.where(situation_id: 6)
        categories = []
        @event.each do |e|
          categories << e
        end
        @outfits[person.id].concat FindOutfitsByCategories(categories, person.gender)

      end


      if CheckSituation(person.id, 7)
        @event = SituationCategory.where(situation_id: 7)
        categories = []
        @event.each do |e|
          categories << e
        end
        @outfits[person.id].concat FindOutfitsByCategories(categories, person.gender)

      end


      if CheckSituation(person.id, 8)
        @event = SituationCategory.where(situation_id: 8)
        categories = []
        @event.each do |e|
          categories << e
        end
        @outfits[person.id].concat FindOutfitsByCategories(categories, person.gender)

      end

  end

      @tripmates.each do |p|
        if p.gender.downcase == 'male'
          category = Category.where('name = \'necessities male\'')
        else
          category = Category.where('name = \'necessities female\'')
        end

        garment_ids = GarmentCategory.where('category_id = ?', category[0].id)
        garment_ids.each do |garment|
          garment = Garment.find(garment.garment_id)
          @essentials[p.id] << garment
        end


      end

  end

  def FindOutfitsByCategories(category, gender)

    category_id = []
    category.each do |c|
      category_id << c.category_id
    end

    outfit_ids = OutfitCategory.where('category_id IN (?)', category_id).group(:outfit_id).order('count(*) DESC').limit(2)
    packing = {}
    outfits = []

    outfit_ids.each do |outfitCat|
      outfit = Outfit.find(outfitCat.outfit_id)
      # if !packing |outfitCat|
      #   packing [outfitCat] = true
      #   outfit << outfitCat
      # end
      if outfit.gender == gender
        outfits << outfit
      end
    end

    return outfits
  end

  def CheckSituation(person_id, situation_id)
    @tripstuff.each do |situation|

      if situation.people_id == person_id &&
          situation.situation_id == situation_id
         return true 
      end

    end
    return false
  end
end
