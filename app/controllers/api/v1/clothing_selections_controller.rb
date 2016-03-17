class Api::V1::ClothingSelectionsController < ApplicationController
  def index
    @clothing_selection = Garment.all
  end

  def create
    @garment = Garment.new(name: params[:name])
    
    if @garment.save
      render :show
    else
      render json: { errors: @garment.errors.full_messages}, status: 422
    end
  end
end
