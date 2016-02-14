class GarmentCategory < ActiveRecord::Base

  belongs_to :garment
  belongs_to :category

end
