class AddOutfitIdAndCategoryIdToOutfitCategories < ActiveRecord::Migration
  def change
    add_column :outfit_categories, :outfit_id, :integer
    add_column :outfit_categories, :category_id, :integer
  end
end
