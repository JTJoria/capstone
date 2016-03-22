class AddPeopleToTripSituations < ActiveRecord::Migration
  def change
    add_column :trip_situations, :people_id, :integer
  end
end
