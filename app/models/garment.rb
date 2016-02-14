class Garment < ActiveRecord::Base

  has_many :garment_categories
  has_many :categories, through: :garment_categories

  has_many :clothing_selctions

end
