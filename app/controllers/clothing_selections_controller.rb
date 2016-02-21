class ClothingSelectionsController < ApplicationController
  def index
    @persons = Person.all
    @outfits  = []

      @persons.each do |p|
        @outfits[p.id] = []
      end

    if params[:wedding] != nil && params[:wedding] != 0

      @event = Situation.find (params[:wedding])
      @persons.each do |p|
        @outfits[p.id].concat  FindOutfitsByCategories(@event.categories[0].id, p.gender)
      end
    end

    if params[:beach] != nil && params[:beach] != 0

      @event = Situation.find (params[:beach])
      @persons.each do |p|
        @outfits[p.id].concat FindOutfitsByCategories(@event.categories[0].id, p.gender)
      end
    end

      # @event = Category.find (params[:necessity])
      # @persons.each do |p|
      #   @outfits[p.id].concat FindOutfitsByCategories(@event.categories[0].id, p.gender)
      # end

  end

  def FindOutfitsByCategories(category_id, gender)
    outfit_ids = OutfitCategory.where('category_id = ?', "#{category_id}")
    outfits = []

    outfit_ids.each do |outfitCat|
      outfit = Outfit.find(outfitCat.outfit_id)
      if outfit.gender == gender
        outfits << outfit
      end
    end
    return outfits
  end
end
