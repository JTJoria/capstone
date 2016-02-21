class ClothingSelectionsController < ApplicationController
  def index
    @persons = Person.all
    @outfits  = []

      @persons.each do |p|
        @outfits[p.id] = []
      end

    if params[:wedding] != nil

      @event = Situation.find (params[:wedding])
      @persons.each do |p|
        @outfits[p.id].concat  FindOutfitsByCategories(@event.categories[0].id, p.gender)
      end
    end

    if params[:beach] != nil

      @event = Situation.find (params[:beach])
      @persons.each do |p|
        @outfits[p.id].concat FindOutfitsByCategories(@event.categories[0].id, p.gender)
      end
    end

    # if params[:sight_seeing] != nil

    #   @event = Situation.find (params[:sight_seeing])
    #   @persons.each do |p|
    #     @outfits[p.id].concat FindOutfitsByCategories(@event.categories[0].id, p.gender)
    #   end
    # end

    # if params[:business_trip] != nil

    #   @event = Situation.find (params[:business_trip])
    #   @persons.each do |p|
    #     @outfits[p.id].concat FindOutfitsByCategories(@event.categories[0].id, p.gender)
    #   end
    # end

    # if params[:nice_dinner] != nil

    #   @event = Situation.find (params[:nice_dinner])
    #   @persons.each do |p|
    #     @outfits[p.id].concat FindOutfitsByCategories(@event.categories[0].id, p.gender)
    #   end
    # end

    # if params[:relax] != nil

    #   @event = Situation.find (params[:relax])
    #   @persons.each do |p|
    #     @outfits[p.id].concat FindOutfitsByCategories(@event.categories[0].id, p.gender)
    #   end
    # end


  end

  def FindOutfitsByCategories(category_id, gender)

    outfit_ids = OutfitCategory.where('category_id = ?', category_id)
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
