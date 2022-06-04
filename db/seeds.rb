# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Airport.delete_all
a1 = Airport.create(code: 'NYC')
a2 = Airport.create(code: 'KOJ')

Flight.create(departure_airport: a1, arrival_airport: a2, start_time: DateTime.now,
              duration: '12:00')
