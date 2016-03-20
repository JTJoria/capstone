class Trip < ActiveRecord::Base

  belongs_to :creator

  has_many :persons
  has_many :locations

  has_many :trip_situations
  has_many :situations, :through => :trip_situations
  
end
