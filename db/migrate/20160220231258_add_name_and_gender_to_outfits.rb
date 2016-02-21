class AddNameAndGenderToOutfits < ActiveRecord::Migration
  def change
    add_column :outfits, :name, :string
    add_column :outfits, :gender, :string

  end
end
