class Outfit < ActiveRecord::Base

  has_many :outfit_garments
  has_many :garments, through: :outfit_garments

  has_many :outfit_categories
  has_many :categories, through: :outfit_categories

end
