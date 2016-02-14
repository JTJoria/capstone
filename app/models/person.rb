class Person < ActiveRecord::Base

  belongs_to :trip

  has_many :clothing_selections

end
