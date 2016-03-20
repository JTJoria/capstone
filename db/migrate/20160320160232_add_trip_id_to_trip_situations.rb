class AddTripIdToTripSituations < ActiveRecord::Migration
  def change
    add_column :trip_situations, :trip_id, :integer
  end
end
