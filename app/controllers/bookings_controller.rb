class BookingsController < ApplicationController
    def new
        @tickets = booking_params[:tickets].to_i
        @flight = Flight.find(booking_params[:flight_id])
        @booking = Booking.new
        @tickets.times {@booking.passengers.build}
    end

    def show
        @booking = Booking.find(params[:id])
        @flight = @booking.flight
        @departure_city = @flight.departure_airport[:city]
        @arrival_city = @flight.arrival_airport[:city]
        @flight_on = @flight.start.strftime("%d-%b-%Y")
        @passengers = @booking.passengers
        @duration = @flight[:duration]
    end
    
    def create
        booking_data = booking_params.except(:tickets)
        @booking = Booking.new(booking_data)   
        
        if @booking.save
            redirect_to @booking
        else
            render :new, status: :unprocessable_entity
        end
    end
    
    private

    def booking_params 
        params.require(:booking).permit(
            :tickets,
            :flight_id,
            passengers_attributes: [
                :name,
                :mobile,
                :email
            ]
        )
    end
end
