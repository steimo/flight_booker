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

700.times do
  dt = DateTime.new(Time.now.year, Time.now.month, Time.now.day + rand(0..5),
                    Faker::Time.between(from: DateTime.now - 1, to: DateTime.now).hour, Faker::Time.between(from: DateTime.now - 1, to: DateTime.now).min)
  duration = "#{rand(2..12)}:00"
  Flight.create(departure_airport: airports.sample, arrival_airport: airports.sample,
                start_time: dt, duration: duration, price: rand(500..900))
end

p "Created #{Flight.count} flights"
