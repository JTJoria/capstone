class CreateGarment2s < ActiveRecord::Migration
  def change
    create_table :garment2s do |t|
      t.string :garments
      t.timestamps 
    end
  end
end
