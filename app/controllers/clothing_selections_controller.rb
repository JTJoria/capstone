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

      wDay = Date.strptime(day["date"]["month"].to_s+'/'+dayHash[:day].to_s+'/'+dayHash[:year].to_s, "%m/%d/%Y")
      if wDay >= this_trip.start_date && wDay <= this_trip.end_date
        @days << dayHash
      end
    end

    if @days.length ==0

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
        outfits = FindOutfitsByCategories(categories, person.gender)
        outfits.each do |outfit|
          if !AlreadyHasOutfit(person.id, outfit.id)
            @outfits[person.id] << outfit
          end
        end
      end

      if CheckSituation(person.id, 3)
        @event = SituationCategory.where(situation_id: 3)
        categories = []
        @event.each do |e|
          categories << e
        end
        outfits = FindOutfitsByCategories(categories, person.gender)
        outfits.each do |outfit|
          if !AlreadyHasOutfit(person.id, outfit.id)
            @outfits[person.id] << outfit
          end
        end
    
      end

      if CheckSituation(person.id, 5)
        @event = SituationCategory.where(situation_id: 5)
        categories = []
        @event.each do |e|
          categories << e
        end
        outfits = FindOutfitsByCategories(categories, person.gender)
        outfits.each do |outfit|
          if !AlreadyHasOutfit(person.id, outfit.id)
            @outfits[person.id] << outfit
          end
        end

      end

      if CheckSituation(person.id, 4)
        @event = SituationCategory.where(situation_id: 4)
        categories = []
        @event.each do |e|
          categories << e
        end
        outfits = FindOutfitsByCategories(categories, person.gender)
        outfits.each do |outfit|
          if !AlreadyHasOutfit(person.id, outfit.id)
            @outfits[person.id] << outfit
          end
        end

      end

      if CheckSituation(person.id, 1)
        @event = SituationCategory.where(situation_id: 1)
        categories = []
        @event.each do |e|
          categories << e
        end
        outfits = FindOutfitsByCategories(categories, person.gender)
        outfits.each do |outfit|
          if !AlreadyHasOutfit(person.id, outfit.id)
            @outfits[person.id] << outfit
          end
        end

      end

      if CheckSituation(person.id, 6)
        @event = SituationCategory.where(situation_id: 6)
        categories = []
        @event.each do |e|
          categories << e
        end
        outfits = FindOutfitsByCategories(categories, person.gender)
        outfits.each do |outfit|
          if !AlreadyHasOutfit(person.id, outfit.id)
            @outfits[person.id] << outfit
          end
        end

      end


      if CheckSituation(person.id, 7)
        @event = SituationCategory.where(situation_id: 7)
        categories = []
        @event.each do |e|
          categories << e
        end
        outfits = FindOutfitsByCategories(categories, person.gender)
        outfits.each do |outfit|
          if !AlreadyHasOutfit(person.id, outfit.id)
            @outfits[person.id] << outfit
          end
        end

      end


      if CheckSituation(person.id, 8)
        @event = SituationCategory.where(situation_id: 8)
        categories = []
        @event.each do |e|
          categories << e
        end
        outfits = FindOutfitsByCategories(categories, person.gender)
        outfits.each do |outfit|
          if !AlreadyHasOutfit(person.id, outfit.id)
            @outfits[person.id] << outfit
          end
        end

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
      if outfit.gender.downcase == gender.downcase
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

  def AlreadyHasOutfit(person_id, outfit_id)
    @outfits[person_id].each do |outfit|
      if outfit.id == outfit_id
        return true
      end
    end
    return false

  end
end
