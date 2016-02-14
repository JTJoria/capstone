class Trip < ActiveRecord::Base

  belongs_to :creator

  has_many :persons
  has_many :locations
  
end
