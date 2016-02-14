class SituationCategory < ActiveRecord::Base

  belongs_to :situation
  belongs_to :category


end
