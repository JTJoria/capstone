class ClothingSelectionsController < ApplicationController
  def index
    persons = Person.all

    @tripmates = []
    this_trip = current_creator.trips.last
    this_trip_id = current_creator.trips.last.id

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

    if this_trip.situations.name == "wedding"
        
      @tripmates.each do |p|
        @outfits[p.id].concat  FindOutfitsByCategories(@event.categories, p.gender)
      end
    end

    if this_trip.situations.name == "beach"

      @tripmates.each do |p|
        @outfits[p.id].concat FindOutfitsByCategories(@event.categories, p.gender)
      end
    end

    if this_trip.situations.name == "sight_seeing"

      @tripmates.each do |p|
        @outfits[p.id].concat FindOutfitsByCategories(@event.categories, p.gender)
      end
    end

    if this_trip.situations.name == "business_trip"

      @tripmates.each do |p|
        @outfits[p.id].concat FindOutfitsByCategories(@event.categories, p.gender)
      end
    end

    if this_trip.situations.name == "nice_dinner"

      @tripmates.each do |p|
        @outfits[p.id].concat FindOutfitsByCategories(@event.categories, p.gender)
      end
    end

    if this_trip.situations.name == "relax"

      @tripmates.each do |p|
        @outfits[p.id].concat FindOutfitsByCategories(@event.categories, p.gender)
      end
    end


    if this_trip.situations.name == "hiking"

      @tripmates.each do |p|
        @outfits[p.id].concat FindOutfitsByCategories(@event.categories, p.gender)
      end
    end


    if this_trip.situations.name == "line_dancing"
      @tripmates.each do |p|
        @outfits[p.id].concat FindOutfitsByCategories(@event.categories, p.gender)
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
      category_id << c.id
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
end
