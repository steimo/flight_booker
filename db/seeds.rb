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
  airports << Airport.create({ code: Faker::Address.country_code_long })
end


500.times do
   Flight.create(departure_airport: airports.sample, arrival_airport: airports.sample,
    start_time: Faker::Date.between(from: '01-01-2022', to: '05-01-2022') , duration: "#{rand(2..12)}:00", price: rand(500..900))
end
  

p "Created #{Flight.count} flights"
