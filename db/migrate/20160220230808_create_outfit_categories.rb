class CreateOutfitCategories < ActiveRecord::Migration
  def change
    create_table :outfit_categories do |t|

      t.timestamps null: false
    end
  end
end
