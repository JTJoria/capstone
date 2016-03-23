class CreatorsController < ApplicationController

  def index
    @creators = Creator.new
  end

  def edit
    @creator = Creator.find_by(id: params[:id])
  end

  def update
    @creator = Creator.find_by(id: params[:id])
    if @creator.update_attributes(creator_params)
      redirect_to '/trips/new'
    else
      render 'edit'
    end
  end

  def creator_params
    params.require(:creator).permit(:name, :gender, :age)
  end

end
