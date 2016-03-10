class Person < ActiveRecord::Base

  belongs_to :trip

  belongs_to :creator

  has_many :clothing_selections

end
