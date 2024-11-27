require "test_helper"

class FlightTest < ActiveSupport::TestCase
  test "gets departure airport through association" do
    flight_one = flights(:one)
    assert flight_one.departure_airport.id == 1
    assert flight_one.departure_airport.code == "BOM"
    assert flight_one.departure_airport.city == "Mumbai"
  end
  test "gets arrival airport through association" do
    flight_one = flights(:one)
    assert flight_one.arrival_airport.id == 6
    assert flight_one.arrival_airport.code == "BBI"
    assert flight_one.arrival_airport.city == "Bhubaneswar"
  end
end
