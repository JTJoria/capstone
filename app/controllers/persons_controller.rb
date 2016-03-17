class PersonsController < ApplicationController

  before_action :require_login
 
  def require_login
    unless creator_signed_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to "/"
    end
  end

  def index

    persons = Person.all
    
    @tripmates = []

    persons.each do |person|
      if current_creator.id == person.creator_id
        @tripmates << person
      end
    end

  end

  def show
    @person = Person.find_by(id: params[:id])
  end

  def create

    @person = Person.new({trip_id: params[:trip_id], name: params[:name], gender: params[:gender], age: params[:age], creator_id: current_creator.id}, email: params[:email])
      
      if @person.save
        flash[:success]= "Trip Mate Added"
        render :show
      else
        redirect_to persons_new_path, flash: {error:  @person.errors.full_messages }
      end

    # redirect_to "/persons/#{@person.id}"
  end

  def new
    @person = Person.new
  end

  def edit
    @person = Person.find_by(id: params[:id])
  end

  def update
    @person = Person.find_by(id: params[:id])
    if @person.update_attributes(person_params)
      redirect_to "/persons/#{@person.id}"
    else
      render 'edit'
    end     
  end

  def destroy
    @person = Person.find_by(id: params[:id])
    @person.destroy

    redirect_to "/persons"
  end

  def person_params
    params.require(:person).permit(:name, :gender, :age)
  end

end
