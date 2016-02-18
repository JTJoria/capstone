class ResultsController < ApplicationController
  def index
    @persons = Person.all
  end
end
