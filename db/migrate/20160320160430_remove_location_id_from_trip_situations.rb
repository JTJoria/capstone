class RemoveLocationIdFromTripSituations < ActiveRecord::Migration
  def change
    remove_column :trip_situations, :location_id, :integer
  end
end
