class ClothingSelectionsController < ApplicationController
  def index
    persons = Person.all

    @tripmates = []

    persons.each do |person|
      if current_creator.id == person.creator_id
        @tripmates << person
      end
    end

    if params[:from] != nil && params[:to] != nil
      p params[:from]

      @start = Date.strptime(params[:from], "%m/%d/%Y")
      @end =  Date.strptime(params[:to], "%m/%d/%Y")
      @length = (@end - @start).to_i + 1
    end



    @city = params[:city] || "Chicago"
    @state = params[:state] || "IL"

    

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

    if params[:wedding] != nil

      @event = Situation.find (params[:wedding])
      @tripmates.each do |p|
        @outfits[p.id].concat  FindOutfitsByCategories(@event.categories, p.gender)
      end
    end

    if params[:beach] != nil

      @event = Situation.find (params[:beach])
      @tripmates.each do |p|
        @outfits[p.id].concat FindOutfitsByCategories(@event.categories, p.gender)
      end
    end

    if params[:sight_seeing] != nil

      @event = Situation.find (params[:sight_seeing])
      @tripmates.each do |p|
        @outfits[p.id].concat FindOutfitsByCategories(@event.categories, p.gender)
      end
    end

    if params[:business_trip] != nil

      @event = Situation.find (params[:business_trip])
      @tripmates.each do |p|
        @outfits[p.id].concat FindOutfitsByCategories(@event.categories, p.gender)
      end
    end

    if params[:nice_dinner] != nil

      @event = Situation.find (params[:nice_dinner])
      @tripmates.each do |p|
        @outfits[p.id].concat FindOutfitsByCategories(@event.categories, p.gender)
      end
    end

    if params[:relax] != nil

      @event = Situation.find (params[:relax])
      @tripmates.each do |p|
        @outfits[p.id].concat FindOutfitsByCategories(@event.categories, p.gender)
      end
    end


    if params[:hiking] != nil

      @event = Situation.find (params[:hiking])
      @tripmates.each do |p|
        @outfits[p.id].concat FindOutfitsByCategories(@event.categories, p.gender)
      end
    end


    if params[:line_dancing] != nil

      @event = Situation.find (params[:line_dancing])
      @tripmates.each do |p|
        @outfits[p.id].concat FindOutfitsByCategories(@event.categories, p.gender)
      end
    end

      @tripmates.each do |p|
        if p.gender == 'Male'
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
