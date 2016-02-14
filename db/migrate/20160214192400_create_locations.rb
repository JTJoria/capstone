class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.integer :trip_id
      t.string :destination
      t.integer :zipcode
      t.datetime :start_day
      t.datetime :end_day

      t.timestamps
    end
  end
end
