require "test_helper"

class AirportTest < ActiveSupport::TestCase
  test "get the arriving flight through association" do
    airport_one = airports(:one)
    airport_one.arriving_flights.pluck(:id) == [2,3]
    assert true
  end
  test "get the departing flights through association" do
    airport_one = airports(:one)
    airport_one.departing_flights.pluck(:id) == [1]
    airport_six = airports(:six)
    airport_six.departing_flights.pluck(:id) == [2]
    airport_three = airports(:three)
    airport_three.departing_flights.pluck(:id) == [3]
  end
end
