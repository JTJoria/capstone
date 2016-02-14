class ClothingSelection < ActiveRecord::Base

  belongs_to :trip_situation

  belongs_to :person

  belongs_to :garment
  
end
