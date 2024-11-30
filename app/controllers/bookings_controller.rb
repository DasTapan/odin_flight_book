class BookingsController < ApplicationController
    def new
        @tickets = booking_params[:tickets].to_i
        @flight = Flight.find(booking_params[:flight_id])
    end

    private

    def booking_params 
        params.require(:booking).permit(
            :tickets,
            :flight_id
        )
    end
end
