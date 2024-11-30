class FlightsController < ApplicationController
    def index
        @airports = Airport.all
        @flight_dates = Flight.order('start').pluck(:start).map {|date| date.strftime("%d-%b-%Y")}.uniq
        if params[:commit]
            start = params[:start]
            departure_airport_id = Airport.find_by(code:params[:departure_airport]).id
            arrival_airport_id = Airport.find_by(code:params[:arrival_airport]).id
            # binding.irb
            @flights = Flight.searched(dep_id: departure_airport_id, ari_id: arrival_airport_id, start: start)
            @result = {flights: @flights, total_tickets: params[:passengers]}
        end
    end

    def new
    end
end
