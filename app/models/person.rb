class Person < ActiveRecord::Base

  belongs_to :trip

  belongs_to :creator

  has_many :clothing_selections

  validates :name, presence: true
  validates :gender, presence: true
  validates :age, presence: true
  validates :email, presence: true

end
