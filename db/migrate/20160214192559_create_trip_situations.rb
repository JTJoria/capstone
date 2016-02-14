class CreateTripSituations < ActiveRecord::Migration
  def change
    create_table :trip_situations do |t|
      t.integer :location_id
      t.integer :situation_id

      t.timestamps
    end
  end
end
