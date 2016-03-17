class SituationsController < ApplicationController

  def index

    persons = Person.all

    @tripmates = []

    persons.each do |person|
      if current_creator.id == person.creator_id
        @tripmates << person
      end
    end


    # if params[:from] != nil && params[:to] != nil
    #   p params[:from]

    #   @start = Date.strptime(params[:from], "%m/%d/%Y")
    #   @end =  Date.strptime(params[:to], "%m/%d/%Y")
    #   @length = (@end - @start).to_i + 1
    # end



    # @city = params[:city] || "Chicago"
    # @state = params[:state] || "IL"

    

    # weather = Unirest.get("http://api.wunderground.com/api/41904cbf33b185b4/forecast10day/q/#{@state}/#{@city}.json").body

    # @forecasts = weather["forecast"]["simpleforecast"]["forecastday"]

    # @days = []
    # @forecasts.each do |day|
    #   dayHash = {}
    #   dayHash[:month] = day["date"]["monthname"]
    #   dayHash[:day] = day["date"]["day"]
    #   dayHash[:year] = day["date"]["year"]
    #   dayHash[:image] = day["icon_url"]
    #   dayHash[:high] = day["high"]["fahrenheit"]
    #   dayHash[:low] = day["low"]["fahrenheit"]
    #   dayHash[:conditions] = day["conditions"]
    #   @days << dayHash
    # end


    

  end

end
