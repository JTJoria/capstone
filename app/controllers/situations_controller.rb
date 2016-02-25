class SituationsController < ApplicationController

  def index
    @persons = Person.all


    if params[:from] != nil && params[:to] != nil
      p params[:from]

      @start = Date.strptime(params[:from], "%m/%d/%Y")
      @end =  Date.strptime(params[:to], "%m/%d/%Y")
      @length = (@end - @start).to_i + 1
    end

  end

end
