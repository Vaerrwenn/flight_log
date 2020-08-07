# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# PILOTS
Pilot.create(name: "Julianna Kays", date_of_birth: Date.today - 10999, gender: "Female")
Pilot.create(name: "Giorno Giordano", date_of_birth: Date.today - 8000, gender: "Male")
Pilot.create(name: "Larissa Massassuchets", date_of_birth: Date.today - 8090 , gender: "Female")

# AIRLINES
Airline.create(name: "Garuda Indonesia", icao_code: "GIA")
Airline.create(name: "Singapore Airlines", icao_code: "SIA")
Airline.create(name: "Lufthansa", icao_code: "DLH")

# MANUFACTURERS
Manufacturer.create(name: "Boeing")
Manufacturer.create(name: "Airbus")
Manufacturer.create(name: "Antonov")
Manufacturer.create(name: "Bombardier")
Manufacturer.create(name: "Comac")
Manufacturer.create(name: "Aerospatiale")

# AIRCRAFTS
Aircraft.create(registration: "PK-AZC", model: "737-800", manufacturer_id: 1)
Aircraft.create(registration: "PK-LXS", model: "A320-300", manufacturer_id: 2)
Aircraft.create(registration: "9V-KBS", model: "A330NEO", manufacturer_id: 2)