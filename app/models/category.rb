class Category < ActiveRecord::Base

  has_many :garment_categories
  has_many :situation_categories

end
