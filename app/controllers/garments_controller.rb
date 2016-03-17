class GarmentsController < ApplicationController
  def index
    @garments = Garments.all
  end
end
