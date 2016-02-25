class ClothingSelectionsController < ApplicationController
  def index
    @persons = Person.all
    @outfits  = []
    @essentials = []

      @persons.each do |p|
        @outfits[p.id] = []
        @essentials[p.id] = []
      end

    if params[:wedding] != nil

      @event = Situation.find (params[:wedding])
      @persons.each do |p|
        @outfits[p.id].concat  FindOutfitsByCategories(@event.categories, p.gender)
      end
    end

    if params[:beach] != nil

      @event = Situation.find (params[:beach])
      @persons.each do |p|
        @outfits[p.id].concat FindOutfitsByCategories(@event.categories, p.gender)
      end
    end

    if params[:sight_seeing] != nil

      @event = Situation.find (params[:sight_seeing])
      @persons.each do |p|
        @outfits[p.id].concat FindOutfitsByCategories(@event.categories, p.gender)
      end
    end

    if params[:business_trip] != nil

      @event = Situation.find (params[:business_trip])
      @persons.each do |p|
        @outfits[p.id].concat FindOutfitsByCategories(@event.categories, p.gender)
      end
    end

    if params[:nice_dinner] != nil

      @event = Situation.find (params[:nice_dinner])
      @persons.each do |p|
        @outfits[p.id].concat FindOutfitsByCategories(@event.categories, p.gender)
      end
    end

    if params[:relax] != nil

      @event = Situation.find (params[:relax])
      @persons.each do |p|
        @outfits[p.id].concat FindOutfitsByCategories(@event.categories, p.gender)
      end
    end


    if params[:hiking] != nil

      @event = Situation.find (params[:hiking])
      @persons.each do |p|
        @outfits[p.id].concat FindOutfitsByCategories(@event.categories, p.gender)
      end
    end


    if params[:line_dancing] != nil

      @event = Situation.find (params[:line_dancing])
      @persons.each do |p|
        @outfits[p.id].concat FindOutfitsByCategories(@event.categories, p.gender)
      end
    end

      @persons.each do |p|
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
