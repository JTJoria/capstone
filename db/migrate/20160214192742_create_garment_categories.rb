class CreateGarmentCategories < ActiveRecord::Migration
  def change
    create_table :garment_categories do |t|
      t.integer :garment_id
      t.integer :category_id

      t.timestamps
    end
  end
end
