class CreatorsController < ApplicationController

  def index
    @creators = Creator.new
  end

end
