class CreateClothingSelections < ActiveRecord::Migration
  def change
    create_table :clothing_selections do |t|
      t.integer :quantity
      t.integer :person_id
      t.integer :garment_id
      t.integer :situation_id

      t.timestamps
    end
  end
end
