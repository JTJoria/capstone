class AddCityStateAndDateToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :city, :string
    add_column :trips, :state, :string
    add_column :trips, :start_date, :datetime
    add_column :trips, :end_date, :datetime
  end
end
