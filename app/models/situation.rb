class Situation < ActiveRecord::Base

  has_many :situation_categories
  has_many :categories, through: :situation_categories

  has_many :trip_situations

end
