# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

mumbai = Airport.find_or_create_by!(code: "BOM", city: "Mumbai")
kolkata = Airport.find_or_create_by!(code: "CCU", city: "Kolkata")
delhi = Airport.find_or_create_by!(code: "DEL", city: "New Delhi")
chennai = Airport.find_or_create_by!(code: "MAA", city: "Chennai")
hyderabad = Airport.find_or_create_by!(code: "HYD", city: "Hyderabad")
bbsr = Airport.find_or_create_by!(code: "BBI", city: "Bhubaneswar")
pune = Airport.find_or_create_by!(code: "PNQ", city: "Pune")
bangalore = Airport.find_or_create_by!(code: "BLR", city: "Bangalore")
trivandrum = Airport.find_or_create_by!(code: "TRV", city: "Trivandrum")
jaipur = Airport.find_or_create_by!(code: "JAI", city: "Jaipur")
ahmedabad = Airport.find_or_create_by!(code: "AMD", city: "Ahmedabad")
vadodara = Airport.find_or_create_by!(code: "BDQ", city: "Vadodara")
indore = Airport.find_or_create_by!(code: "IDR", city: "Indore")
lucknow = Airport.find_or_create_by!(code: "LKO", city: "Lucknow")
dehradun = Airport.find_or_create_by!(code: "DED", city: "Dehradun")
chandigarh = Airport.find_or_create_by!(code: "IXC", city: "Chandigarh")
port_blair = Airport.find_or_create_by!(code: "IXZ", city: "Port Blair")
guwahati = Airport.find_or_create_by!(code: "GAU", city: "Guwahati")

[
  [bbsr,mumbai],[bbsr,delhi],[bbsr,bangalore],[bbsr,kolkata],[mumbai,delhi],
  [mumbai,kolkata],[mumbai,bangalore],[delhi,kolkata],[delhi,bangalore]
].each do|dep,ari|
  Flight.find_or_create_by(
    departure_airport_id: dep.id,
    arrival_airport_id: ari.id,
    start: (DateTime.current + 2.day).change(hour: rand(4..22), min: rand(60)),
    duration: "#{rand(1..3)}:#{rand(15..60)}:00"
  )
  Flight.find_or_create_by(
    departure_airport_id: ari.id,
    arrival_airport_id: dep.id,
    start: (DateTime.current + 2.day).change(hour: rand(4..22), min: rand(60)),
    duration: "#{rand(1..3)}:#{rand(15..60)}:00"
  )
end
