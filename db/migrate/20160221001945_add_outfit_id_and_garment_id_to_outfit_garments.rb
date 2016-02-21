class AddOutfitIdAndGarmentIdToOutfitGarments < ActiveRecord::Migration
  def change
    add_column :outfit_garments, :outfit_id, :integer
    add_column :outfit_garments, :garment_id, :integer
  end
end
