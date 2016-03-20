class TripSituation < ActiveRecord::Base

  belongs_to :situation
  belongs_to :trip


end
