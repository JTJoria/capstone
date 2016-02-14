class TripSituation < ActiveRecord::Base

  has_many :clothing_selections

  belongs_to :location

  belongs_to :situation

end
