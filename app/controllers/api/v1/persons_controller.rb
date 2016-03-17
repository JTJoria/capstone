class Api::V1::PersonsController < ApplicationController
  def index
    @persons = Person.all
  end

  def create
    @person = Person.new(name: params[:name], gender: params[:gender], age: params[:age], email: params[:email])

    if @person.save
      render :show
    else
      render json: { errors: @person.errors.full_messages }, status: 422
    end
  end
end
