# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Airport.delete_all
Flight.delete_all
airports = []
5.times do
  airports << Airport.create({ code: ('A'..'Z').to_a.sample(3).join })
end

200.times do
  p Flight.create(departure_airport: airports.sample, arrival_airport: airports.sample,
    start_time: Faker::Date.between(from: '01-01-2022', to: '02-01-2022'), duration: "#{rand(2..12)}:00", price: rand(200..900))
end
  
Flight.create(departure_airport: airports[0], arrival_airport: airports[1],
  start_time: '05-05-2022', duration: "12:00")

p "Created #{Flight.count} flights"
