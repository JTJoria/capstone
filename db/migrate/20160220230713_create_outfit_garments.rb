class CreateOutfitGarments < ActiveRecord::Migration
  def change
    create_table :outfit_garments do |t|

      t.timestamps null: false
    end
  end
end
