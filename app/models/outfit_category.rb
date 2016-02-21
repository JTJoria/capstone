class OutfitCategory < ActiveRecord::Base

  belongs_to :outfit

  def search(category_id)
    OutfitCategory.where('category_id = ?', "#{category_id}")
  end

end
