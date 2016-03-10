class Creator < ActiveRecord::Base

  has_many :trips
  has_many :people
  has_many :persons, through: :trips
  has_many :locations, through: :trips
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
