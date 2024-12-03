require "test_helper"

class BookingTest < ActiveSupport::TestCase
  test "flight has many bookings" do
    flight_two = flights(:two)
    assert flight_two.bookings.pluck(:id) == [12,15,65]
  end

  test "booking belongs to a flight" do
    booking_one = bookings(:one)
    assert booking_one.flight.id == 2
  end
end
