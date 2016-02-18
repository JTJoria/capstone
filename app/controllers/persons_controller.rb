class PersonsController < ApplicationController

  def index
    @persons = Person.all
  end

  def show
    @person = Person.find_by(id: params[:id])
  end

  def create
    @person = Person.new({name: params[:name], gender: params[:gender], age: params[:age]})

    @person.save

    flash[:success]= "Trip Mate Added"

    redirect_to "/persons/#{@person.id}"
  end

  def new
    @person = Person.new
  end

  def edit
    @person = Person.find_by(id: params[:id])
  end

  def update
    @person = Person.find_by(id: params[:id])
  end

  def destroy
    @person = Person.find_by(id: params[:id])
    @person.destroy

    redirect_to "/persons"
  end


end
