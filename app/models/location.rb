class Location < ActiveRecord::Base

  belongs_to :trip

  has_many :trip_situations

end
