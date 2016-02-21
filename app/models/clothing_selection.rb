class ClothingSelection < ActiveRecord::Base

  belongs_to :person

  belongs_to :outfit
  
end
