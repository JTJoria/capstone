class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.integer :creator_id

      t.timestamps
    end
  end
end
