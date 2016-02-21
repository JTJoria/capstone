class TripSituation < ActiveRecord::Base

  belongs_to :location

  belongs_to :situation

end
